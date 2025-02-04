//
//  DiscoverViewController.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 3.02.2025.
//

import UIKit

class DiscoverViewController: UIViewController, DiscoverViewModelOutputProtocol {
    func didFetchSportsCategory(sports: News) {
        self.categoryBusiness = sports.articles ?? []
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFetchGeneralCategory(general: News) {
        self.categoryBusiness = general.articles ?? []
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func didFetchScienceCategory(science: News) {
        self.categoryBusiness = science.articles ?? []
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func didFetchHealthCategory(healtH: News) {
        self.categoryBusiness = healtH.articles ?? []
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func didFetchBusinessCategory(business: News) {
        self.categoryBusiness = business.articles ?? []
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFetchCategoryError(error: any Error) {
        print("Category page error: \(error.localizedDescription)")
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var categorySegmented: UISegmentedControl!
    
    var categoryBusiness: [Article] = []
    private var viewModel: DiscoverViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel?.fetchCategoryBusiness()
        
    }
    

    @IBAction func cagetorySegmentedButton(_ sender: Any) {
        switch categorySegmented.selectedSegmentIndex {
        case 0:
            viewModel?.fetchCategoryBusiness()
        case 1:
            viewModel?.fetchCategoryHealth()
        case 2:
            viewModel?.fetchCategoryScience()
        case 3:
            viewModel?.fetchCategorySports()
        case 4:
            viewModel?.fetchCategoryGeneral()
        default:
            break
        }
    }
    
    func configure(viewModel: DiscoverViewModel) {
        self.viewModel = viewModel
        viewModel.output = self
    }
    

}

extension DiscoverViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryBusiness.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverTableViewCell.identifier, for: indexPath) as! DiscoverTableViewCell
        cell.setup(category: categoryBusiness[indexPath.row])
        return cell
    }
}

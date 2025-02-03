//
//  SearchViewController.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 3.02.2025.
//

import UIKit

class SearchViewController: UIViewController, SearchViewModelOutPutProtocol {
    
    func didFetchSearchNews(searchNews: News, search: String) {
        self.searchNews = searchNews.articles ?? []
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFetchSearchError(error: any Error) {
        print("Search Controller error: \(error.localizedDescription)")
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchOutlet: UISearchBar!
    
    private var viewModel: SearchViewModel?
    var searchNews: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func configure(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        viewModel.output = self
    }
    
}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as! SearchTableViewCell
        cell.setup(search: searchNews[indexPath.row])
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let viewModel = viewModel, !searchText.isEmpty else { return }
                viewModel.fetchSearchNews(search: searchText)
    }
}

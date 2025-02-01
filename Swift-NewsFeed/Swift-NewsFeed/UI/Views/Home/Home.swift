//
//  ViewController.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 30.01.2025.
//

import UIKit

class HomeViewController: UIViewController, HomeProtocolOutPut {
    
    func didFetchData(data: News) {
        self.newDataNews = data
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func didFetchErro(error: any Error) {
        print("Protocol outputunun controllerinde bir hata: \(error.localizedDescription)")
    }
    
    
    //MARK: - Outlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    var newsData = [Article]()
    var newDataNews: News?
    private var viewModel : HomeViewModel?
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel?.testGetUser()
        collectionView.collectionViewLayout = mainLayout()
        
    }
    
    func configure(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        viewModel.output = self
    }
    
    
    
    //MARK: -FUNCTIONS
    private func setup() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: HomeCollectionReusableView.identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionReusableView.identifier)
    }
    
    
    //MARK: -COMPOSİTİONAL LAYOUT
    private func mainLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout{ [weak self] (index, environment) -> NSCollectionLayoutSection? in
            return self?.createdSectionLayout(index: index, environment: environment)
        }
        
        return layout
    }
    
    private func createdSectionLayout(index:Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch index {
        case 0:
            return createdFirsSection()
        case 1:
            return createdSecondSection()
        default:
            return createdFirsSection()
        }
    }
    
    private func createdFirsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.45))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 30, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [createSupplementaryHeader()]
        
        return section
    }
    
    private func createdSecondSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.boundarySupplementaryItems = [createSupplementaryHeader()]
        
        return section
    }
    
    private func createSupplementaryHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }


}





//MARK: - Collectin View

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return newDataNews?.articles?.count ?? 0
        case 1: return twoMoc.count
        default:
            return 0
        }
    }
    
    //MARK: - Collection Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingCollectionViewCell.identifier, for: indexPath) as! TrendingCollectionViewCell
            let art = newDataNews?.articles?[indexPath.row]
            cell.imageView.image = UIImage(named: "one")
            cell.secondImageView.image = UIImage(named: "two")
            cell.descriptionLabel.text = art?.description
            cell.secondImageLabel.text = art?.title
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentCollectionViewCell.identifier, for: indexPath) as! RecentCollectionViewCell
            cell.setup(recent: twoMoc[indexPath.row])
            return cell
        default:
            fatalError("bla bla")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let layout = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionReusableView.identifier, for: indexPath) as! HomeCollectionReusableView
            switch indexPath.section {
            case 0:
                layout.setup(reusable: "Trending")
            case 1:
                layout.setup(reusable: "Recent Stories")
            default:
                layout.setup(reusable: "Geçersiz")
            }
            return layout
        default:
            return UICollectionReusableView()
        }
    }
}

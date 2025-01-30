//
//  ViewController.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 30.01.2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        collectionView.collectionViewLayout = mainLayout()
    }
    
    private func setup() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
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
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func createdSecondSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        
        return section
    }


}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return oneMoc.count
        case 1: return twoMoc.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingCollectionViewCell.identifier, for: indexPath) as! TrendingCollectionViewCell
            cell.setup(trend: oneMoc[indexPath.row])
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentCollectionViewCell.identifier, for: indexPath) as! RecentCollectionViewCell
            cell.setup(recent: twoMoc[indexPath.row])
            return cell
        default:
            fatalError("bla bla")
        }
    }
}

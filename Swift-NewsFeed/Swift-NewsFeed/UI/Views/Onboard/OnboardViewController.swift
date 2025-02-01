//
//  OnboardViewController.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 31.01.2025.
//

import UIKit

class OnboardViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == onboardMoc.count - 1 {
                self.continueBtn.setTitle("Get Started", for: .normal)
                self.skipBtn.isHidden = true
            } else {
                self.continueBtn.setTitle("Continue", for: .normal)
                self.skipBtn.isHidden = false
            }
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        //pageControl.numberOfPages = onboardMoc.count
    }
    

    @IBAction func continueBtnClicked(_ sender: Any) {
        if currentPage == onboardMoc.count - 1 {
                let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                let serviceManager: ServiceManagerProtocol = ServiceManager.shared
                let viewModel = HomeViewModel(networkService: serviceManager)
                homeVC.configure(viewModel: viewModel)
                
                homeVC.modalPresentationStyle = .fullScreen
                present(homeVC, animated: true)
            } else {
                currentPage += 1
                let index = IndexPath(item: currentPage, section: 0)
                collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            }
    }
    
    
    @IBAction func skipBtnClicked(_ sender: Any) {
        currentPage += 2
        let index = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
    

}

extension OnboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardMoc.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardCollectionViewCell.identifier, for: indexPath) as! OnboardCollectionViewCell
        cell.setup(onboard: onboardMoc[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}

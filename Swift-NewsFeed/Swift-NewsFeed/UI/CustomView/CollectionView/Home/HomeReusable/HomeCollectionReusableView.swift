//
//  HomeCollectionReusableView.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 31.01.2025.
//

import UIKit

protocol HomeReusableProtocol {
    func homeReusable(indexPat:IndexPath)
}

class HomeCollectionReusableView: UICollectionReusableView {
    
    static let identifier = String(describing: HomeCollectionReusableView.self)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    func setup(reusable: String) {
        titleLabel.text = reusable
    }
    
    var homeReusableProtocol: HomeReusableProtocol?
    var homeReusableIndexPath: IndexPath?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBAction func buttonAction(_ sender: Any) {
        if let reusable = homeReusableIndexPath {
            homeReusableProtocol?.homeReusable(indexPat: reusable)
        } else {
            print("Reusable error")
        }
    }
    
}

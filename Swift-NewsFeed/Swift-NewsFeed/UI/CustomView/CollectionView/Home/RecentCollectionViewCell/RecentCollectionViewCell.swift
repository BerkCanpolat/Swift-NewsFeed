//
//  RecentCollectionViewCell.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 30.01.2025.
//

import UIKit

class RecentCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: RecentCollectionViewCell.self)
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondImageLabel: UILabel!
    
    
    func setup(recent: MockData) {
        imageView.image = UIImage(named: recent.image)
        descriptionLabel.text = recent.description
        secondImageView.image = UIImage(named: recent.secondImage)
        secondImageLabel.text = recent.secondImageTitle
    }
    
    
}

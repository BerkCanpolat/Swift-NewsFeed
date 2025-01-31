//
//  TrendingCollectionViewCell.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 30.01.2025.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: TrendingCollectionViewCell.self)
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondImageLabel: UILabel!
    
    
    func setup(trend: MockData) {
        imageView.image = UIImage(named: trend.image)
        descriptionLabel.text = trend.description
        secondImageView.image = UIImage(named: trend.secondImage)
        secondImageLabel.text = trend.secondImageTitle
        secondImageView.layoutIfNeeded()
        secondImageView.layer.cornerRadius = secondImageView.frame.height / 2.3
    }
    
    
    
    
}

//
//  RecentCollectionViewCell.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 30.01.2025.
//

import UIKit
import Kingfisher

class RecentCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: RecentCollectionViewCell.self)
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondImageLabel: UILabel!
    
    

        func setup(bbc: Article) {
            let placeholderImage = UIImage(named: "logo")
            imageView.kf.setImage(with: bbc.urlToImage?.asUrl, placeholder: placeholderImage)
            descriptionLabel.text = bbc.description ?? "Anonim"
            secondImageView.kf.setImage(with: bbc.urlToImage?.asUrl, placeholder: placeholderImage)
            secondImageLabel.text = bbc.author ?? "Anonim"
            secondImageView.layoutIfNeeded()
            secondImageView.layer.cornerRadius = secondImageView.frame.height / 2.3
        }
    
    
}

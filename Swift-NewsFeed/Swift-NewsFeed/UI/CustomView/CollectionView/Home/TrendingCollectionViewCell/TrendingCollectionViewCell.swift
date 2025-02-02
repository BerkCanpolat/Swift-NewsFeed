//
//  TrendingCollectionViewCell.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 30.01.2025.
//

import UIKit
import Kingfisher

class TrendingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: TrendingCollectionViewCell.self)
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondImageLabel: UILabel!
    
    @IBOutlet weak var viewsLabel: UILabel!
    
    func setup(topHeadline: Article) {
        let placeholderImage = UIImage(named: "logo")
        imageView.kf.setImage(with: topHeadline.urlToImage?.asUrl, placeholder: placeholderImage)
        descriptionLabel.text = topHeadline.description ?? "Anonim"
        secondImageView.kf.setImage(with: topHeadline.urlToImage?.asUrl, placeholder: placeholderImage)
        secondImageLabel.text = topHeadline.author ?? "Anonim"
        secondImageView.layoutIfNeeded()
        secondImageView.layer.cornerRadius = secondImageView.frame.height / 2.3
        viewsLabel.text = "230 Views"
    }
    
}

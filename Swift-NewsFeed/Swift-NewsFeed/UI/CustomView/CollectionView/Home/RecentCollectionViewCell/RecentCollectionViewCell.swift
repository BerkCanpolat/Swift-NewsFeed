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
    
    

        func setup(trend: Article) {
            imageView.kf.setImage(with: trend.urlToImage?.asUrl) { result in
                switch result {
                case .success:
                    break
                case .failure:
                    self.imageView.image = UIImage(named: "one")
                }
            }
            descriptionLabel.text = trend.description ?? "Anonim"
            secondImageView.kf.setImage(with: trend.urlToImage?.asUrl) { result in
                switch result {
                case .success:
                    break
                case .failure:
                    self.secondImageView.image = UIImage(named: "one")
                }
            }
            secondImageLabel.text = trend.author ?? "Anonim"
            secondImageView.layoutIfNeeded()
            secondImageView.layer.cornerRadius = secondImageView.frame.height / 2.3
        }
    
    
}

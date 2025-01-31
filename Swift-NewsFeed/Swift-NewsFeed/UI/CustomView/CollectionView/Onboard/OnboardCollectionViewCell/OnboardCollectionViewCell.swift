//
//  OnboardCollectionViewCell.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 31.01.2025.
//

import UIKit

class OnboardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardCollectionViewCell.self)
    
    
    @IBOutlet weak var onboardImageView: UIImageView!
    @IBOutlet weak var onboardDescription: UILabel!
    @IBOutlet weak var onboardSecond: UILabel!
    
    func setup(onboard: OnboardMockData) {
        onboardImageView.image = UIImage(named: onboard.image)
        onboardDescription.text = onboard.title
        onboardSecond.text = onboard.secondTitle
    }
    
}

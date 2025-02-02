//
//  DetailsViewController.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 3.02.2025.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondLabel: UILabel!
    
    
    var news: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let new = news {
            let placeholderImage = UIImage(named: "logo")
            let imageUrl = new.urlToImage?.asUrl
            imageView.kf.setImage(with: imageUrl, placeholder: placeholderImage)
            titleLabel.text = new.title
            descriptionLabel.text = new.description
            secondLabel.text = new.author
            secondImageView.kf.setImage(with: imageUrl, placeholder: placeholderImage)
        }
       
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

   

}

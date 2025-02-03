//
//  SearchTableViewCell.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 3.02.2025.
//

import UIKit
import Kingfisher

class SearchTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: SearchTableViewCell.self)
    
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchLabel: UILabel!
    
    func setup(search: Article) {
        let img = UIImage(named: "logo")
        searchImageView.kf.setImage(with: search.urlToImage?.asUrl, placeholder: img)
        searchLabel.text = search.description
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

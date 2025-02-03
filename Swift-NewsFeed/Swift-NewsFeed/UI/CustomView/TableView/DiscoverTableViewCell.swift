//
//  DiscoverTableViewCell.swift
//  Swift-NewsFeed
//
//  Created by Berk Canpolat on 3.02.2025.
//

import UIKit
import Kingfisher

class DiscoverTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: DiscoverTableViewCell.self)
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(category: SourceCategory) {
        authorLabel.text = category.name
        titleLabel.text = category.description
        categoryImageView.image = UIImage(named: "logo")
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

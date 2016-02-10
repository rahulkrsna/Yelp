//
//  BusinessCell.swift
//  Yelp
//
//  Created by rcvasant on 2/9/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import AFNetworking

class BusinessCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var ratingsImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var reviewsCountLabel: UILabel!
    
    var business: Business! {
        didSet {
            nameLabel.text = business.name
            locationLabel.text = business.address
            categoryLabel.text = business.categories
            distanceLabel.text = business.distance
            reviewsCountLabel.text = (business.reviewCount?.stringValue)! + " reviews"
            thumbImageView.setImageWithURL(business.imageURL!)
            ratingsImageView.setImageWithURL(business.ratingImageURL!)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbImageView.layer.cornerRadius = 3
        thumbImageView.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

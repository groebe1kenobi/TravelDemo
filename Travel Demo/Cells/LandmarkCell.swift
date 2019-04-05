//
//  LandmarkListTableViewCell.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/6/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class LandmarkCell: UITableViewCell, ReusableIdentifier {
	
	@IBOutlet var locationLabel: UILabel!
	@IBOutlet var locationDistanceLabel: UILabel!
	@IBOutlet var cardView: UIView!
	@IBOutlet var locationImageView: UIImageView!
	@IBOutlet weak var descriptionLabel: UILabel!
	
}

extension LandmarkCell: ConfigurableCell {
	
	func configure(object: Landmark) {
		
		let descHeight = descriptionLabel.optimalHeight
		descriptionLabel.frame = CGRect(x: descriptionLabel.frame.origin.x, y: descriptionLabel.frame.origin.y, width: descriptionLabel.frame.width, height: descHeight)
		
		locationLabel.text = object.title
		locationLabel.sizeToFit()
		locationDistanceLabel.text = "\(2.2) miles"
		locationDistanceLabel.sizeToFit()
		cardView.layer.cornerRadius = 5
		cardView.layer.masksToBounds = true
		//cardView.layer.backgroundColor = my.blue.cgColor
		ImageService.getImage(withURL: object.imageUrl) { image in
			if let image = image {
				self.locationImageView.image = image
				self.locationImageView.layer.cornerRadius = 10
				self.locationImageView.clipsToBounds = true
				self.locationImageView.layer.borderWidth = 3
				self.locationImageView.layer.borderColor = my.purple.cgColor
			}
		}
	
		
	}
}

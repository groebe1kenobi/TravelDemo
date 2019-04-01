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
	let my = MyColors()
}

extension LandmarkCell: ConfigurableCell {
	
	func configure(object: Landmark) {
		
		locationLabel.text = object.title
		locationLabel.sizeToFit()
		locationDistanceLabel.text = "\(2.2) miles"
		locationDistanceLabel.sizeToFit()
		cardView.layer.cornerRadius = 5
		cardView.layer.masksToBounds = true
		cardView.layer.backgroundColor = my.blue.cgColor
		ImageService.getImage(withURL: object.imageUrl) { image in
			if let image = image {
				self.locationImageView.image = image
			}
		}
	
		
	}
}

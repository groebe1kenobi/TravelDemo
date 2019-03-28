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
}

extension LandmarkCell: ConfigurableCell {
	func configure(object: Landmark) {
		locationLabel.text = object.title
		locationDistanceLabel.text = "\(2.2)"
		
	}
}

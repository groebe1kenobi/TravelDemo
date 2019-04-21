//
//  ReviewSiteCell.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/28/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import CDYelpFusionKit

class ReviewSiteCell: UITableViewCell, ReusableIdentifier {

	@IBOutlet weak var ratingImageView: UIImageView!
	@IBOutlet weak var reviewCount: UILabel!
	@IBOutlet weak var companyLogoImageView: UIImageView!
	@IBOutlet weak var yelpImageView: UIImageView!
	
}

extension ReviewSiteCell: ConfigurableCell {
	
	func configure(object: CDYelpBusiness ) {
	
			
			self.reviewCount.text = "\(object.reviewCount ?? 0)"
			self.companyLogoImageView.image = CDImage.yelpBurstLogoRed()
		
	}
}

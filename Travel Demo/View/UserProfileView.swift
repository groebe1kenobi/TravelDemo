//
//  UserProfileView.swift
//  Travel Demo
//
//  Created by Sean Groebe on 4/21/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class UserProfileView: UIView {

	@IBOutlet weak var proPicImageView: UIImageView!
	@IBOutlet weak var pointsLabel: UILabel!
	@IBOutlet weak var visitedCountLabel: UILabel!
	
	lazy var profilePicture: UIImageView = {
		var proPic: UIImage?
		var proPicImageView: UIImageView?
		ImageService.getImage(withURL: currentUser.fbProPicURL!) { image in
			if let image = image {
				proPic = image
			}
		}
		
		
		
	}()

}

//
//  ReviewSiteDataSource.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/28/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import Foundation
import UIKit
import CDYelpFusionKit

class ReviewSiteDataSource: NSObject {
	private var businessList = [CDYelpBusiness]()
	private let tableView: UITableView
	
	init(tableView: UITableView) {
		self.tableView = tableView
		super.init()
		tableView.dataSource = self
		tableView.reloadData()
	}
}

extension ReviewSiteDataSource: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: ReviewSiteCell.reuseIdentifier, for: indexPath) as! ReviewSiteCell
		CDYelpFusionKitManager.shared.apiClient.fetchBusiness(forId: "KbZ9cSMoAIsTWASs6m5mJw", locale: nil) { (business) in
			if let business = business {
				
				
				cell.reviewCount.text = "Based on \(business.reviewCount ?? 0) Reviews"
				cell.ratingImageView.image = self.yelpStars(business.rating ?? 0)
				cell.companyLogoImageView?.image = UIImage(named: "yelp_logo")
				
//				ImageService.getImage(withURL: (business.imageUrl?.absoluteString)!) { image in
//					if let image = image {
//						cell.yelpImageView.image = image
//					}
//				}
				
			}
			
		}
	return cell

}
	
	private func configure(cell: UITableViewCell, indexPath: IndexPath) {
		if let cell = cell as? ReviewSiteCell {
			//let object = businessList[indexPath.row]
			CDYelpFusionKitManager.shared.apiClient.fetchBusiness(forId: "KbZ9cSMoAIsTWASs6m5mJw", locale: nil) { business in
				if let business = business {
					print("Configuring businessFDDFDDFFDDFFFF")
					cell.configure(object: business)
				}
			}
			
		}
	}
	
	private func yelpStars(_ rating: Double) -> UIImage {
		switch rating {
		case 0.0:
			return UIImage(named: "yelp_stars_zero_small")!
		case 1.0:
			return UIImage(named: "yelp_stars_one_small")!
		case 1.5:
			return UIImage(named: "yelp_stars_one_half_small")!
		case 2.0:
			return UIImage(named: "yelp_stars_two_small")!
		case 2.5:
			return UIImage(named: "yelp_stars_two_half_small")!
		case 3.0:
			return UIImage(named: "yelp_stars_three_small")!
		case 3.5:
			return UIImage(named: "yelp_stars_three_half_small")!
		case 4.0:
			return UIImage(named: "yelp_stars_four_small")!
		case 4.5:
			return UIImage(named: "yelp_stars_four_half_small")!
		case 5.0:
			return UIImage(named: "yelp_stars_five_small")!
		default:
			return UIImage(named: "yelp_stars_zero_small")!
		}

	}
	
	
}



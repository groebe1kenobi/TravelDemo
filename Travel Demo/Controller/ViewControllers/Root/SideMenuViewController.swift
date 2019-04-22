//
//  SideMenuViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 4/21/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var userPicImageView: UIImageView!
//	@IBOutlet weak var userPointsLabel: UILabel!
//	@IBOutlet weak var numVisitedLabel: UILabel!
	
	private var dataSource: SideMenuDataSource?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
//		ImageService.getImage(withURL: currentUser.fbProPicURL!) { image in
//			self.userPicImageView.image = image
//		}
//		userPointsLabel.text = "\(currentUser.points)"
//		numVisitedLabel.text = "\(currentUser.totalVisited)"
		tableView.estimatedRowHeight = 82
		tableView.rowHeight = UITableView.automaticDimension
		tableView.tableFooterView?.isHidden = true
		self.dataSource = SideMenuDataSource(tableView: tableView)
		tableView.dataSource = dataSource
		tableView.delegate = self
		tableView.reloadData()
		
		
    }
    

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		navigationController?.setNavigationBarHidden(false, animated: animated)
		ImageService.getImage(withURL: currentUser.fbProPicURL!) { image in
		
			self.userPicImageView.makeCircle(image!)
			
		}
		
		if let index = self.tableView.indexPathForSelectedRow {
			self.tableView.deselectRow(at: index, animated: true)
		}
		
	}

}


extension SideMenuViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("Selected Row!")
		
	}
}

extension UIImageView {
	func makeCircle(_ userImage: UIImage) {
		self.contentMode = .scaleAspectFill
		self.layer.cornerRadius = self.frame.height / 2
		self.layer.masksToBounds = false
		self.clipsToBounds = true
		
		self.image = userImage
	}
}

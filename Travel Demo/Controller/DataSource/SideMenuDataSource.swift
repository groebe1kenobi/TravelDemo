//
//  SideMenuDataSource.swift
//  Travel Demo
//
//  Created by Sean Groebe on 4/21/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import Foundation
import UIKit

class SideMenuDataSource: NSObject {
	private let tableView: UITableView
	init(tableView: UITableView) {
		self.tableView = tableView
		super.init()
		tableView.dataSource = self
		tableView.reloadData()
	}
}

extension SideMenuDataSource: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! SideMenuTableViewCell
		//cell.optionLabel.adjustsFontSizeToFitWidth = true
		
		switch indexPath.row {
		case 0:
			cell.optionLabel.text = "Saved"
			cell.iconImageView.image = UIImage(named: "list")
			cell.backgroundColor = my.blue
			
			
		case 1:
			cell.optionLabel.text = "Progress"
			cell.iconImageView.image = UIImage(named: "checked")
			cell.backgroundColor = my.pink
			
		case 2:
			cell.optionLabel.text = "Settings"
			cell.backgroundColor = my.purple
			cell.iconImageView.image = UIImage(named: "settings")
		case 3:
			cell.optionLabel.text = "About Us"
			cell.backgroundColor = my.lightBlue
			cell.iconImageView.image = UIImage(named: "about")
			
		case 4:
			cell.optionLabel.text = "Terms & Conditions"
			cell.backgroundColor = my.orange
			cell.iconImageView.image = UIImage(named: "tos")
			
			
			
		default:
			print("Error getting here")
		}
		
		return cell
	}
}

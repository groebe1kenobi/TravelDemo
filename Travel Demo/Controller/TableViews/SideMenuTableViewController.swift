//
//  SideMenuTableViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/4/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuTableViewController: UITableViewController {
	
	let my = MyColors()

    override func viewDidLoad() {
        super.viewDidLoad()
		//SideMenuManager.menuFadeStatusBar = false
		title = "Menu"
	//	tableView.rowHeight = UITableView.automaticDimension
		//tableView.estimatedRowHeight = 130
	
		
    }

	override func viewWillAppear(_ animated: Bool) {
		navigationController?.setNavigationBarHidden(false, animated: animated)
	}
	
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
		
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return 4
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! SideMenuTableViewCell
		//cell.optionLabel.adjustsFontSizeToFitWidth = true
		
		switch indexPath.row {
		case 0:
			cell.optionLabel.text = "User Profile"
			cell.iconImageView.image = UIImage(named: "userIcon")
			cell.backgroundColor = my.blue
			
			
		case 1:
			cell.optionLabel.text = "Settings"
			cell.iconImageView.image = UIImage(named: "settings")
			cell.backgroundColor = my.pink
			
		case 2:
			cell.optionLabel.text = "About Us"
			cell.backgroundColor = my.purple
			cell.iconImageView.image = UIImage(named: "about")

		case 3:
			cell.optionLabel.text = "Terms & Conditions"
			cell.backgroundColor = my.orange
			cell.iconImageView.image = UIImage(named: "tos")
			
		

		default:
			print("Error getting here")
		}

        return cell
    }
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		switch indexPath.row {
		case 0:
			self.performSegue(withIdentifier: "menuToProfile", sender: self)
		case 1:
			print("Nothing to do yet")
		case 2:
			print("Nothing to do yet")
		case 3:
			print("Nothing to do yet")
		default:
			print("Shouldn't get here - cannot tap a side menu cell past index 4.")
		}
	}
	
}

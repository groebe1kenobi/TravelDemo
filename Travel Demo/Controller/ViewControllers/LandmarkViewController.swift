//
//  LandmarkViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/14/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class LandmarkViewController: UIViewController {

	@IBOutlet weak var landmarkImageView: UIImageView!
	@IBOutlet weak var descriptionTextView: UITextView!
	@IBOutlet weak var tableView: UITableView!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
	override func viewWillAppear(_ animated: Bool) {
		navigationController?.setNavigationBarHidden(false, animated: animated)
	}
	
	@IBAction func addLandmarkButton(_ sender: Any) {
	}
	
}

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
	
	var landmark: Landmark?
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
	override func viewWillAppear(_ animated: Bool) {
		navigationController?.setNavigationBarHidden(false, animated: animated)
		ImageService.getImage(withURL: (landmark?.imageUrl)!) { image in
			self.landmarkImageView.image = image
		}
		
	}
	
	@IBAction func addLandmarkButton(_ sender: Any) {
	}
	
}

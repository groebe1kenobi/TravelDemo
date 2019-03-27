//
//  LandmarkViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/14/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import CoreData

class LandmarkViewController: UIViewController {

	@IBOutlet weak var landmarkImageView: UIImageView!
	@IBOutlet weak var descriptionTextView: UITextView!
	@IBOutlet weak var tableView: UITableView!
	
	var stateController = StateController.shared
	
	var userLandmarks: [Landmark] {
		return stateController.userLandmarks 
	}
	
	var landmark: Landmark?
	
	//let cdHelper = CoreDataHelper()
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
	
	override func viewWillDisappear(_ animated: Bool) {
		
	}
	
	@IBAction func addLandmarkButton(_ sender: Any) {
		
		let alert = UIAlertController(title: "New Landmark", message: "Add Landmark to your list", preferredStyle: .alert)
		let addAction = UIAlertAction(title: "Add", style: .default) {
			[unowned self] action in
			guard let landmarkToAdd = self.landmark else {
				return
			}
			
			self.stateController.addLandmarkToSave(landmarkToAdd)
			
			//cdHelper.save(landmarkToAdd)
			print("Added: \(landmarkToAdd)")
			
		}
		
		
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
		
		alert.addAction(addAction)
		alert.addAction(cancelAction)
		present(alert, animated: true)
		
		
		
		print("Landmark \((landmark?.title)!) added to visited array")
	}
	
	
	
}

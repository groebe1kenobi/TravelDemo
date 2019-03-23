//
//  UserProfileViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/4/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
	
	

	@IBOutlet weak var profilePicImageView: UIImageView!
	
	var myLandmarks = [Landmark]()
	
	private var landmarkTableViewController: ToVisitTableViewController?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		guard let landmarkController = children.first as? ToVisitTableViewController else {
			fatalError()
		}
		landmarkTableViewController = landmarkController
		//landmarkController.delegate = self
		navigationController?.title = currentUser.firstName
		profilePicImageView.image = currentUser.proPic
		
		
		
		
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(false, animated: animated)
		
		myLandmarks = LibraryAPI.shared.getSavedLandmarks()
		
		for landmark in myLandmarks {
			print(landmark.title!)
		}
		
		//defaults.getUserDefaults()
	}
	
	
	
	
	
	



}

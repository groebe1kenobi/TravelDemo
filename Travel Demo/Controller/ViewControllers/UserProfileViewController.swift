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
	var savedLandmarks: [Landmark] {
		return currentUser.savedLandmarks ?? []
	}

	

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(false, animated: animated)
		//cdHelper.fetch()

		
		defaults.getUserDefaults()
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		
		navigationController?.title = currentUser.firstName 
		profilePicImageView.image = currentUser.proPic
		profilePicImageView.layer.borderWidth = 1
		profilePicImageView.layer.masksToBounds = false
		profilePicImageView.layer.cornerRadius = profilePicImageView.frame.height/2
		profilePicImageView.clipsToBounds = true
		
//		if let title = currentUser.cdLandmarks.first {
//			print(title)
//			
//			print(title.value(forKey: "title") as Any)
//		}
		
	
		
		
    }
	
	
	
	



}

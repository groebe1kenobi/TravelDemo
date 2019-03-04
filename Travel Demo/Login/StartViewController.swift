//
//  StartViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/4/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import FirebaseAuth
import FacebookCore
import FacebookLogin
import FBSDKLoginKit
class StartViewController: UIViewController {

	override func viewDidAppear(_ animated: Bool){
		super.viewDidAppear(animated)
		 
	}
	
	@IBAction func facebookLogin(sender: UIButton) {
		let fbLoginManager = FBSDKLoginManager()
		fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
			if let error = error {
				print("Failed to login: \(error.localizedDescription)")
				return
			}
			
			guard let accessToken = FBSDKAccessToken.current() else {
				print("Failed to get access token")
				return
			}
			
			let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
			
			// Perform login by calling Firebase APIs
			Auth.auth().signInAndRetrieveData(with: credential, completion: { (user, error) in
				if let error = error {
					print("Login error: \(error.localizedDescription)")
					let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
					let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
					alertController.addAction(okayAction)
					self.present(alertController, animated: true, completion: nil)
					
					return
				}
				
				self.performSegue(withIdentifier: "startToMain", sender: nil)
				
				
				//				// Present the main view
				//				if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainView") {
				//					UIApplication.shared.keyWindow?.rootViewController = viewController
				//					self.dismiss(animated: true, completion: nil)
				//				}
				
			})
			
		}
	}

}

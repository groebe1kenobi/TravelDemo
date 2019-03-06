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

var globalUser: User?
class StartViewController: UIViewController {

	override func viewDidAppear(_ animated: Bool){
		super.viewDidAppear(animated)
		 
	}
	
	@IBAction func didTapFacebookLogin(_ sender: UIButton) {
		let loginManager = LoginManager()
		loginManager.logIn(readPermissions: [.publicProfile, .email], viewController: self, completion: didReceiveFacebookLoginResult)
	}

}



extension StartViewController {
	private func didReceiveFacebookLoginResult(loginResult: LoginResult) {
		switch loginResult {
		case .success:
			didLoginWithFacebook()
		case .failed(_): break
		default: break
		}
	}
	
	private func didLoginWithFacebook() {
		// Successful log in with Facebook
		if let accessToken = AccessToken.current {
			let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.authenticationToken)
			Auth.auth().signInAndRetrieveData(with: credential, completion: { (user, error) in
				if let error = error {
					print("Login error: \(error.localizedDescription)")
					let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
					let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
					alertController.addAction(okayAction)
					self.present(alertController, animated: true, completion: nil)
					
					return
				}
				let facebookAPIManager = FacebookAPIManager(accessToken: accessToken)
				facebookAPIManager.requestFacebookUser(completion: { (facebookUser) in
					globalUser = facebookUser
					print(" TEST \(globalUser?.firstName ?? "Fail")")
					self.performSegue(withIdentifier: "startToMain", sender: nil)
				})
				
			})
			
		}
	}
	
	private func didLogin(method: String, info: String) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let loginVC = storyboard.instantiateViewController(withIdentifier: "MainStory")
		self.present(loginVC, animated: true, completion: nil)
	}
}

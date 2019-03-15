//
//  TestViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/4/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
//import FirebaseAuth

class TestViewController: UIViewController {
//	func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
//		switch result {
//		case .success:
//			didLoginWithFacebook()
//
//		case .failed(_): break
//
//		default: break
//		}
//	}
	
	func loginButtonDidLogOut(_ loginButton: LoginButton) {
		print("Not much to do here")
	}
	

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		//self.presentHomeVC()
		if fbLoginManager.isLoggedIn() {
			
			print("FB MANAGER LOGGED IN")
			currentUser.wasPrevLoggedIn = true
			defaults.getUserDefaults()
			
			self.performSegue(withIdentifier: "splashToMap", sender: self)
		}
		//else {
			
//			print("FB NOT LOGGED IN")
////			fbLoginButton.delegate = self
////			fbLoginButton.frame.size = CGSize(width: self.view.frame.size.width, height: 64)
////			fbLoginButton.center = CGPoint(x: self.view.center.x, y: self.view.frame.size.height - fbLoginButton.frame.size.height / 2 - 64)
////			view.addSubview(fbLoginButton)
//
//		}
	}
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		print("View Did Appear")
		//self.presentHomeVC()
		
	}
	

	@IBAction func didTapFacebookLogin(_ sender: UIButton) {
		fbLoginManager.logIn(readPermissions: [.publicProfile, .email], viewController: self, completion: didReceiveFacebookLoginResult )
		print("Did tap FB LOGIN")
	}
	
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
			let facebookAPIManager = FacebookAPIManager(accessToken: accessToken)
			facebookAPIManager.makeFbGraphRequest()
			
			self.presentHomeVC()
		}
	}
	
	
	private func presentLoginScreenVC() {
		let storyboard = UIStoryboard(name: "Login", bundle: nil)
		let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVCIdentifier")
		self.present(loginVC, animated: true, completion: nil)
	}
	
	private func presentHomeVC() {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let loginVC = storyboard.instantiateViewController(withIdentifier: "MainStory")
		self.present(loginVC, animated: true, completion: nil)
	}

}


extension LoginManager {
	func isLoggedIn() -> Bool {
		if AccessToken.current != nil { return true}
		return false
	}
}


extension UserDefaults {
	
	func saveUserDefaults() {
		if currentUser.fbAccessToken != nil {
			defaults.set(currentUser.fbAccessToken, forKey: StrConstant.fbAccessToken)
		}
		
		if currentUser.fbId != nil {
			defaults.set(currentUser.fbId, forKey: StrConstant.fbId)
		}
		
		if currentUser.email != nil {
			defaults.set(currentUser.email, forKey: StrConstant.email)
		}
		
		if currentUser.fbProPicURL != nil {
			defaults.set(currentUser.fbProPicURL, forKey: StrConstant.fbProPicURL)
		}
		
		if currentUser.firstName != nil {
			defaults.set(currentUser.firstName, forKey: StrConstant.firstName)
		}
		
		if currentUser.lastName != nil {
			defaults.set(currentUser.lastName, forKey: StrConstant.lastName)
		}
		
		if let points = currentUser.points  {
			defaults.set(points, forKey: StrConstant.points)
		}
		
	}
	
	func getUserDefaults() {
		
		if let accessToken = defaults.object(forKey: StrConstant.fbAccessToken) {
			currentUser.fbAccessToken = accessToken as? String
		} else if let accessToken = AccessToken.current {
			currentUser.fbAccessToken = accessToken.authenticationToken
		} else {
			print("Access token cannot be determined currently...")
		}
		
		if let fbId = defaults.object(forKey: StrConstant.fbId) {
			currentUser.fbId = fbId as? String
		}
		
		if let email = defaults.object(forKey: StrConstant.email) {
			currentUser.email = email as? String
		}
		
		if let proPicURL = defaults.object(forKey: StrConstant.fbProPicURL) {
			currentUser.fbProPicURL = proPicURL as? String
			ImageService.getImage(withURL: currentUser.fbProPicURL!) { image in
				currentUser.proPic = image
				
			}
		}
		
		if let firstName = defaults.object(forKey: StrConstant.firstName) {
			currentUser.firstName = firstName as? String
		}
		
		if let lastName = defaults.object(forKey: StrConstant.lastName) {
			currentUser.lastName = lastName as? String 
		}
		
		if let points = defaults.object(forKey: StrConstant.points) {
			currentUser.points = points as? Int
		}
		
		
		
		printDefaults()
		
	}
	
	func printDefaults() {
		let defaultDic = defaults.dictionaryRepresentation()
		
		for item in defaultDic {
			print("\(item.key): \(item.value)")
		}
	}
	
	
}





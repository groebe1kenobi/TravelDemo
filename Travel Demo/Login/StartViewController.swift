//
//  StartViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/4/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
//import Firebase
//import FirebaseAuth
import FacebookCore
import FacebookLogin


var globalUser: User?
class StartViewController: UIViewController {

	//var docRef: DocumentReference! // Firebase Db
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//docRef = Firestore.firestore().collection("users").document("Test")
	}
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
//		if let accessToken = AccessToken.current {
//			let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.authenticationToken)
//			Auth.auth().signInAndRetrieveData(with: credential, completion: { (user, error) in
//				if let error = error {
//					print("Login error: \(error.localizedDescription)")
//					let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
//					let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//					alertController.addAction(okayAction)
//					self.present(alertController, animated: true, completion: nil)
//
//					return
//				}
//				let facebookAPIManager = FacebookAPIManager(accessToken: accessToken)
//				facebookAPIManager.requestFacebookUser(completion: { (facebookUser) in
//					globalUser = facebookUser
//					print(" TEST \(globalUser?.firstName ?? "Fail")")
//					self.performSegue(withIdentifier: "startToMain", sender: nil)
//					self.uploadToFirebase(facebookUser)
//				})
//
//			})
//
//		}
	}
	
	private func didLogin(method: String, info: String) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let loginVC = storyboard.instantiateViewController(withIdentifier: "MainStory")
		self.present(loginVC, animated: true, completion: nil)
	}
	
//	private func uploadToFirebase(_ user: User) {
//		let dataToSave: [String: Any] = ["firstName": user.firstName ?? "Fuck", "fbID": user.id ?? "Up"]
//		docRef.setData(dataToSave) { (error) in
//			if let error = error {
//				print("Oh no \(error.localizedDescription)!")
//			}
//		}
//	}
}

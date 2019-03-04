//
//  LoginViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/2/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FBSDKLoginKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
	
	private let readPermissions: [ReadPermission] = [.publicProfile, .email, .userFriends]
	@IBOutlet weak var email: UITextField!
	@IBOutlet weak var password: UITextField!

	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		
        // Do any additional setup after loading the view.
    }
    
	
	
	
	
	@IBAction func loginAction(_ sender: Any) {
		Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
			if error == nil{
				self.performSegue(withIdentifier: "loginToMain", sender: self)
			}
			else{
				let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
				let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
				
				alertController.addAction(defaultAction)
				self.present(alertController, animated: true, completion: nil)
			}
		}
	}
	
	
	

}






extension LoginViewController {
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
			facebookAPIManager.requestFacebookUser(completion: { (facebookUser) in
				if let _ = facebookUser.email {
					let info = "First name: \(facebookUser.firstName!) \n Last name: \(facebookUser.lastName!) \n Email: \(facebookUser.email!)"
					self.didLogin(method: "Facebook", info: info)
				}
			})
		}
	}
	
	private func didLogin(method: String, info: String) {
		let message = "Successfully logged in with \(method). " + info
		let alert = UIAlertController(title: "Success", message: message, preferredStyle: UIAlertController.Style.alert)
		alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
		performSegue(withIdentifier: "loginToHome", sender: self)
		
	}
}

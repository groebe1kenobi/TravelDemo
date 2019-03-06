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








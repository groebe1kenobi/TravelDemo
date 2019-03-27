//
//  SplashViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/21/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		if fbLoginManager.isLoggedIn() {
			defaults.getUserDefaults()
			self.performSegue(withIdentifier: "splashToMap", sender: self)
		} else {
			let storyboard = UIStoryboard(name: "Login", bundle: nil)
			let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC")
			self.present(loginVC, animated: true, completion: nil)
		}
	}



}

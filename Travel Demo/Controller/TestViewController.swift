//
//  TestViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/4/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import FirebaseAuth
class TestViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//		self.presentLoginScreenVC()
//    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		if Auth.auth().currentUser != nil {
			print("\(String(describing: Auth.auth().currentUser))")
			self.presentHomeVC()
		} else {
			self.presentLoginScreenVC()
		}
		//self.presentLoginScreenVC()
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

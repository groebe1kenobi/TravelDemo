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
	@IBOutlet weak var displayNameLabel: UILabel!
	@IBOutlet weak var progressBar: ProgressBarView!
	
	var timer: Timer!
	var progressCounter:Float = 0
	let duration:Float = 10.0
	var progressIncrement:Float = 0
	
	override func viewDidLoad() {
        super.viewDidLoad()

		progressIncrement = 1.0/duration
		timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.showProgress), userInfo: nil, repeats: true)
    }
    
	@objc func showProgress() {
		if(progressCounter > 1.0){timer.invalidate()}
		progressBar.progress = progressCounter
		progressCounter = progressCounter + progressIncrement
	}


}

//
//  FacebookLoginButton.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/2/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

let kFacebookLoginButtonBackgroundColor = UIColor(displayP3Red: 59/255, green: 89/255, blue: 153/255, alpha: 1)
let kFacebookLoginButtonTintColor = UIColor.white
let kFacebookLoginButtonCornerRadius: CGFloat = 13.0

class FacebookLoginButton: UIButton {

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.configureUI()
	}
	
	private func configureUI() {
		self.backgroundColor = kFacebookLoginButtonBackgroundColor
		self.layer.cornerRadius = kFacebookLoginButtonCornerRadius
		self.tintColor = kFacebookLoginButtonTintColor
		self.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
	}

}

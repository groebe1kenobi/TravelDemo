//
//  UserContoroller.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/21/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import Foundation

protocol UserModelControllerObserver: AnyObject {
	func userModelControllerDidUpdate(_ controller: UserModelContoroller)
}

class UserModelContoroller {
	private var user: User
	//private let dataLoader: DataLoader
	init(user: User) {
		self.user = user
	}
	
}

extension UserModelContoroller {
	func addLandmark(_ landmark: Landmark) {
		guard !(user.savedLandmarks?.contains(landmark))! else {
			return
		}
		
		user.savedLandmarks?.append(landmark)
	}
}

extension UserModelContoroller {
	func addObserver(_ observer: UserModelControllerObserver) {
		// perform actions 
	}
}

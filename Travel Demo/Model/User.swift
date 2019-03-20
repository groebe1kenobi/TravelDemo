//
//  User.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/2/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import CoreData
class User {
	
	var firstName: String?
	var lastName: String?
	var email: String?
	var fbId: String?
	var fbProPicURL: String?
	var fbAccessToken: String?
	var points: Int?
	var savedLandmarks: [Landmark]?
	var cdLandmarks: [NSManagedObject] = []
	var visitedLocations: [Landmark]?
	var proPic: UIImage?
	var wasPrevLoggedIn: Bool = false
	
	func isProfilePicture() -> Bool {
		if proPic != nil {
			return true
		}
		return false
	}
	
	func isProfilePicAsset() -> Bool {
		if proPic != nil {
			return true
		}
		return false
	}
	
}

class CurrentUser: User {
	
	// Creates static shared instance of current user
	static let sharedInstance = CurrentUser()
	
	// Prevents others from using default '()' init
	fileprivate override init() {}
	
	// Holds authorization Dictionary returned from FB upon login
	var fbAuthDict: [String: Any]?
	
}





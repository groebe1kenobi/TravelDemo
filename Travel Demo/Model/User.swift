//
//  User.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/2/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class User {
	
	let firstName: String?
	let lastName: String?
	let email: String?
	let id: String?
	let profilePicture: String?
	var points: Int?
	var locationsToVisit: [Landmark]?
	var visitedLocations: [Landmark]?
	
	
	init (dictionary: [String: Any]) {
		self.firstName = dictionary["first_name"] as? String
		self.lastName = dictionary["last_name"] as? String
		self.email = dictionary["email"] as? String
		self.id = dictionary["id"] as? String
		if let pictureDict = dictionary["picture"] as? [String: Any] {
			if let dataDict = pictureDict["data"] as? [String: Any] {
				self.profilePicture = dataDict["url"] as? String
				return
			}
		}
		self.profilePicture = ""
	}
	
	init (firstName: String?, lastName: String?, email: String?, id: String?, profilePicture: String?, points: Int?, locationsToVisit: [Landmark]?, visitedLocations: [Landmark]?) {
		self.firstName = firstName
		self.lastName = lastName
		self.email = email
		self.id = id
		self.profilePicture = profilePicture
		self.points = 0
		self.locationsToVisit = []
		self.visitedLocations = []
	}
}




//
//  StateController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/26/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import Foundation

class StateController {
	private let persistencyManager = PersistencyManager()

	
	private let imageService = ImageService()
	private let isOnline = false // determines if server should be updated with changes
	
	static let shared = StateController()
	
	func getLandmarks() -> [Landmark] {
		return persistencyManager.getLandmark()
	}
	
	func getSavedLandmarks() -> [Landmark] {
		return persistencyManager.getSavedLandmarks()
	}
	
	func addLandmarkToSave(_ landmark: Landmark) {
		persistencyManager.addLandmarkToSave(landmark)
	}
	
	func saveMyLandmarks() {
		persistencyManager.saveMyLandmarks()
	}
	
	
	
	var allLandmarks: [Landmark] {
		return persistencyManager.getLandmark()
	}
	var userLandmarks: [Landmark] {
		return persistencyManager.getSavedLandmarks()
	}
	
	
}

extension StateController {
	
	func filter(_ type: String) -> [Landmark] {
		switch type {
		case let type where type == "Restaurant":
			return allLandmarks.filter({$0.type == "Restaurant" }).map({return $0})
		case let type where type == "Drink":
			return allLandmarks.filter({$0.type == "Drink" }).map({return $0})
		case let type where type == "Nature":
			return allLandmarks.filter({$0.type == "Nature" }).map({return $0})
		case let type where type == "Entertainment":
			return allLandmarks.filter({$0.type == "Entertainment" }).map({return $0})
		case let type where type == "Museum":
			return allLandmarks.filter({$0.type == "Museum" }).map({return $0})
		default:
			return []
		}
		
	
		
	}
}




//
//  LibraryAPI.swift
//  Travel Demo
//
//  Created by Sean Groebe on 2/6/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import Foundation
import UIKit

final class LibraryAPI {
	static let shared = LibraryAPI()
	
	
	
	private let persistencyManager = PersistencyManager()
	
	private let imageService = ImageService()
	private let isOnline = false // determines if server should be updated with changes
	
	func getLandmark() -> [Landmark] {
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
	
	var userLandmarks: [Landmark] {
		return persistencyManager.getSavedLandmarks()
	}
}

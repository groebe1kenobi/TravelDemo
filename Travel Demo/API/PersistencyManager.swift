//
//  PersistencyManager.swift
//  Travel Demo
//
//  Created by Sean Groebe on 2/6/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import Foundation
import UIKit

final class PersistencyManager {
	private var landmarks =  [Landmark]()
	private var userLandmarks = [Landmark]()
	
	init() {
		//let savedURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("LocInfo.json")
		let savedURL = documents.appendingPathComponent(Filenames.AllLandmarks)
		var data = try? Data(contentsOf: savedURL)
		if data == nil, let bundleURL = Bundle.main.url(forResource: Filenames.AllLandmarks, withExtension: nil) {
			data = try? Data(contentsOf: bundleURL)
		}
		
		if let landmarkData = data,
			let decodedLandmark = try? JSONDecoder().decode([Landmark].self, from: landmarkData) {
			landmarks = decodedLandmark
			saveLandmarks()
		}
		
		let userSavedUrl = documents.appendingPathComponent(Filenames.UserLandmarks)
		var userData = try? Data(contentsOf: userSavedUrl)
		if userData == nil, let bundleURL2 = Bundle.main.url(forResource: Filenames.UserLandmarks, withExtension: nil) {
			userData = try? Data(contentsOf: bundleURL2)
		}
		
		if let userLandmarkData = userData,
			let decodedUserLandmrks = try? JSONDecoder().decode([Landmark].self, from: userLandmarkData) {
			userLandmarks = decodedUserLandmrks
			saveMyLandmarks()
		}
	}
	
	func getLandmark() -> [Landmark] {
		return landmarks
	}
	
	func getSavedLandmarks() -> [Landmark] {
		return userLandmarks
	}
	
	func addLandmarkToSave(_ landmark: Landmark) {
		userLandmarks.append(landmark)
	}

	func addLandmark(_ landmark: Landmark, at index: Int) {
		if (landmarks.count >= index) {
			landmarks.insert(landmark, at: index)
		} else {
			landmarks.append(landmark)
		}
	}
	
	func deleteLandmark(at index: Int) {
		landmarks.remove(at: index)
	}
	
	
	
	
	
	// returns URL of the cache directory, where u store files to re-download
	private var cache: URL {
		return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
	}
	
	func saveImage(_ image: UIImage, filename: String) {
		let url = cache.appendingPathComponent(filename)
		guard let data = image.pngData() else {
			return
		}
		try? data.write(to: url)
	}
	
	func getImage(with filename: String) -> UIImage? {
		let url = cache.appendingPathComponent(filename)
		guard let data = try? Data(contentsOf: url) else {
			return nil
		}
		return UIImage(data: data)
	}
	
	
	private enum Filenames {
		static let AllLandmarks = "LocInfo.json"
		static let UserLandmarks = "userLoc.json"
	}
	
	/// defining URL where file is saved
	private var documents: URL {
		return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
	}

	func saveLandmarks() {
		//let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("LocInfo.json")
		let url = documents.appendingPathComponent(Filenames.AllLandmarks)
		let encoder = JSONEncoder()
		guard let encodedData = try? encoder.encode(landmarks) else {
			print(" Couldn't return")
			return
		}
		try? encodedData.write(to: url)
	}
	
	func saveMyLandmarks() {
		let url = documents.appendingPathComponent(Filenames.UserLandmarks)
		let encoder = JSONEncoder()
		guard let encodedData = try? encoder.encode(userLandmarks) else {
			print("Couldn't encode User Landmarks")
			return
		}
		
		try? encodedData.write(to: url)
	}
}

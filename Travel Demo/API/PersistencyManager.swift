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
	
	init() {
		//let savedURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("LocInfo.json")
		let savedURL = documents.appendingPathComponent("LocInfo.json")
		var data = try? Data(contentsOf: savedURL)
		if data == nil, let bundleURL = Bundle.main.url(forResource: "LocInfo.json", withExtension: nil) {
			data = try? Data(contentsOf: bundleURL)
		}
		
		if let landmarkData = data,
			let decodedLandmark = try? JSONDecoder().decode([Landmark].self, from: landmarkData) {
			landmarks = decodedLandmark
			saveLandmarks()
		}
			
		
		
	}
	
	func getLandmark() -> [Landmark] {
		return landmarks
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
	
	
	
	
	/// defining URL where file is saved
	private var documents: URL {
		return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
	}

	func saveLandmarks() {
		//let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("LocInfo.json")
		let url = documents.appendingPathComponent("LocInfo.json")
		let encoder = JSONEncoder()
		guard let encodedData = try? encoder.encode(landmarks) else {
			print(" Couldn't return")
			return
		}
		try? encodedData.write(to: url)
	}
}

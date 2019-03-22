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
	private let httpClient = HTTPClient()
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
	
	
	@objc func downloadImage(with notification: Notification) {
		
		guard let userInfo = notification.userInfo,
			let imageView = userInfo["imageView"] as? UIImageView,
			let imageUrl = userInfo["imageUrl"] as? String,
			let filename = URL(string: imageUrl)?.lastPathComponent else {
				return
		}
		
		// if image prev downloaded, retrive from persistency mgr
		if let savedImage = persistencyManager.getImage(with: filename) {
			imageView.image = savedImage
			return
		}
		
		
		// else when downlad complete disp. image in IV
		// save locally using persistency mgr
		DispatchQueue.global().async {
			let downloadedImage = self.httpClient.downloadImage(imageUrl) ?? UIImage()
			DispatchQueue.main.async {
				imageView.image = downloadedImage
				self.persistencyManager.saveImage(downloadedImage, filename: filename)
			}
		}
	}

}

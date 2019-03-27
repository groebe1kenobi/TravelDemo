//
//  HTTPClient.swift
//  Travel Demo
//
//  Created by Sean Groebe on 2/14/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import Foundation

class ImageService {
	
	static let cache = NSCache<NSString, UIImage>()
	
	static func downloadImage(withURL urlStr: String, completion: @escaping (_ image: UIImage?)-> ()) {
		let url = URL(string: urlStr)
		let dataTask = URLSession.shared.dataTask(with: url!) { data, responseURL, error in
			var downloadedImage: UIImage?
			
			if let data = data {
				downloadedImage = UIImage(data: data)
			}
			
			if downloadedImage != nil {
				cache.setObject(downloadedImage!, forKey: urlStr as NSString)
			}
			DispatchQueue.main.async {
				completion(downloadedImage)
			}
			
		}
		
		dataTask.resume()
	}
	
	static func getImage(withURL urlStr: String, completion: @escaping(_ image: UIImage?)-> ()) {
		if let image = cache.object(forKey: urlStr as NSString) {
			completion(image)
		} else {
			downloadImage(withURL: urlStr, completion: completion)
		}
	}
}

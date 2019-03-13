//
//  HTTPClient.swift
//  Travel Demo
//
//  Created by Sean Groebe on 2/14/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import Foundation

class HTTPClient {
	@discardableResult func getRequest(_ url: String) -> AnyObject {
		return Data() as AnyObject
	}
	
	@discardableResult func postRequest(_ url: String, body: String) -> AnyObject {
		return Data() as AnyObject
	}
	
	func downloadImage(_ url: String) -> UIImage? {
		print("checking this ish out")
		let aUrl = URL(string: url)
		guard let data = try? Data(contentsOf: aUrl!),
			let image = UIImage(data: data) else {
				return nil
		}
		return image
	}
}

class ImageService {
	static func downloadImage(withURL urlStr: String, completion: @escaping (_ image: UIImage?)-> ()) {
		let url = URL(string: urlStr)
		let dataTask = URLSession.shared.dataTask(with: url!) { data, url, error in
			var downloadedImage: UIImage?
			
			if let data = data {
				downloadedImage = UIImage(data: data)
			}
			DispatchQueue.main.async {
				completion(downloadedImage)
			}
			
		}
		
		dataTask.resume()
	}
}

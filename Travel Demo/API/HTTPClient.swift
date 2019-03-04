//
//  HTTPClient.swift
//  Travel Demo
//
//  Created by Sean Groebe on 2/14/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class HTTPClient {
	@discardableResult func getRequest(_ url: String) -> AnyObject {
		return Data() as AnyObject
	}
	
	@discardableResult func postRequest(_ url: String, body: String) -> AnyObject {
		return Data() as AnyObject
	}
	
	func downloadImage(_ url: String) -> UIImage? {
		let aUrl = URL(string: url)
		guard let data = try? Data(contentsOf: aUrl!),
			let image = UIImage(data: data) else {
				return nil
		}
		return image
	}
}

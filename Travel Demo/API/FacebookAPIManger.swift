//
//  FacebookAPIManger.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/2/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

enum ResponseStatus {
	case success
	case error(error: String)
}
class FacebookAPIManager {
	let accessToken: AccessToken
	
	init(accessToken: AccessToken) {
		self.accessToken = accessToken
	}
	
	let imageChache = NSCache<AnyObject, AnyObject>()
	func makeFbGraphRequest() {
		let authParams = ["fields": "id, email, last_name, first_name, picture.width(480).height(480)"]
		
		let graphRequest = GraphRequest(graphPath: "me", parameters: authParams, accessToken: accessToken, httpMethod: .GET, apiVersion: .defaultVersion)
		
		graphRequest.start{ (response: HTTPURLResponse?, result: GraphRequestResult<GraphRequest>) in
			switch result {
			case .success(let graphResponse):
				if let dictionary = graphResponse.dictionaryValue {
					currentUser.fbAuthDict = dictionary
					if let authDict = currentUser.fbAuthDict {
						self.setGraphRequestResponse(authDict)
					}
				}
			case .failed(let error):
				print(error.localizedDescription)
			}
		}
	}
	
	func setGraphRequestResponse(_ result: [String: Any]) {
		currentUser.fbAccessToken = AccessToken.current?.authenticationToken
		
		if let fbId = result["id"] {
			currentUser.fbId = fbId as? String
			
		}
		
		if let email = result["email"] {
			currentUser.email = email as? String
		}
		
		if let firstName = result["first_name"] {
			currentUser.firstName = firstName as? String
		}
		
		if let lastName = result["last_name"] {
			currentUser.lastName = lastName as? String
		}
		
		if let pictureDict = result["picture"] as? [String: Any] {
			if let dataDict = pictureDict["data"] as? [String: Any] {
				currentUser.fbProPicURL = dataDict["url"] as? String
				
			}
		}
		
		if currentUser.fbProPicURL != nil {
			ImageService.getImage(withURL: currentUser.fbProPicURL!) { image in
				currentUser.proPic = image
			}
		}
		
		defaults.saveUserDefaults()
		
	}
	
	
	
}


extension UIApplication {
	//A helper to get a file path from the documents folder
	class func fileInDocumentsDirectory(_ filename: String) -> String {
		let fileURL = getDocumentsURL().appendingPathComponent(filename)
		return fileURL.path
	}
	
	//A helper to get the documents directory URL
	class func getDocumentsURL() -> URL {
		let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
		return documentsURL
	}
}

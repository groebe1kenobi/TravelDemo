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
	
	func requestFacebookUser(completion: @escaping (_ facebookUser: User) -> Void) {
		let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields":"id,email,last_name,first_name,picture"], accessToken: accessToken, httpMethod: .GET, apiVersion: .defaultVersion)
		graphRequest.start { (response: HTTPURLResponse?, result: GraphRequestResult<GraphRequest>) in
			switch result {
			case .success(let graphResponse):
				if let dictionary = graphResponse.dictionaryValue {
					completion(User(dictionary: dictionary))
				}
				break
			default:
				print("Facebook request user error")
			}
		}
	}
	
}



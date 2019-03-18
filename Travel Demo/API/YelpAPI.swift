//
//  YelpAPI.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/18/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import Foundation
import CDYelpFusionKit

final class CDYelpFusionKitManager: NSObject {
	static let shared = CDYelpFusionKitManager()
	
	var apiClient: CDYelpAPIClient!
	
	func configure() {
		self.apiClient = CDYelpAPIClient(apiKey: yelpAPIKey)
	}
	
	
	
}

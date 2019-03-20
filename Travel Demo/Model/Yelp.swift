//
//  Yelp.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/18/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import Foundation

let yelpClientID = "7pDLxPAd_Gw9cTeEOAbp3A"
let yelpAPIKey = "Vy45v5bLzpkcFKdmIMD3VkQV2LdBC5iDEVyPhfOt_VoYRSFi8N8819AMno-e_0mVVR5GOx1oqsYeX_8xTnPnDdTnksx8kFJH7Dp2oakH8eTWwRVdVMzltTrSeX-KXHYx"

struct Yelp: Decodable {
	let name: String
	let url: String
	let imageUrl: String
	
	enum CodingKeys: String, CodingKey {
		case name = "name"
		case url = "url"
		case imageUrl = "image_url"
	}
}

//
//  TestLocation.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/26/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import Foundation
import CoreLocation

class TestLocation: Codable {
	static let dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateStyle = .medium
		formatter.timeStyle = .medium
		return formatter
	}()
	
	var coordinates: CLLocationCoordinate2D {
		return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
	
	let latitude: Double
	let longitude: Double
	let date: Date
	let dateString: String
	let description: String
	
	init(_ location: CLLocationCoordinate2D, date: Date, descriptionString: String) {
		latitude =  location.latitude
		longitude =  location.longitude
		self.date = date
		dateString = TestLocation.dateFormatter.string(from: date)
		description = descriptionString
	}
	
	convenience init(visit: CLVisit, descriptionString: String) {
		self.init(visit.coordinate, date: visit.arrivalDate, descriptionString: descriptionString)
	}
}

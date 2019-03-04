//
//  Landmark.swift
//  Travel Demo
//
//  Created by Sean Groebe on 2/5/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import Foundation
import MapKit
import Contacts



class Landmark:  NSObject, MKAnnotation, Codable {
	let title: String?
	let name: String
	let type: String
	let imageUrl: String
	let latitude: String
	let longitude: String
	
	
	init(title: String, name: String, type: String, imageUrl: String, latitude: String, longitude: String) {
		self.title = title
		self.name = name
		self.type = type
		self.imageUrl = imageUrl
		self.latitude = latitude
		self.longitude = longitude
		
		super.init()
	}
	
	var coordinate: CLLocationCoordinate2D {
		let lat = Double(latitude)
		let lon = Double(longitude)
		return CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
	}
	
	var subtitle: String? {
		return name
	}
	
	// Annotation right callout accessory opens this mapItem in Maps app
	func mapItem() -> MKMapItem {
		let addressDict = [CNPostalAddressStreetKey: subtitle!]
		let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
		let mapItem = MKMapItem(placemark: placemark)
		mapItem.name = title
		return mapItem
	}
	
	var markerTintColor: UIColor {
		switch type {
		case "sport":
			return .blue
		case "nuseum":
			return .orange
		case "restaurant":
			return .purple
		case "park":
			return .green
		default:
			return .black
		}
	}
	
	var imageName: String? {
		if type == "Sport" { return "baseball"}
		if type == "Restaurant" {return "restaurant"}
		if type == "Museum"	{return "museum"}
		return "skiMask"
	}

}

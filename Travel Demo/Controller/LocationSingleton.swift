//
//  LocationSingleton.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/28/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import MapKit

let SharedUserLocation = LocationSingleton()
class LocationSingleton: NSObject, CLLocationManagerDelegate {
	var locationManager: CLLocationManager?
	var lastLocation: CLLocation?
	var currentLocation2d: CLLocationCoordinate2D?
	var currentLocation: CLLocation?
	
	
	class var manager: LocationSingleton {
		return SharedUserLocation
	}
	
	override init() {
		super.init()
		
		locationManager?.delegate = self
		locationManager?.desiredAccuracy = kCLLocationAccuracyBest
		locationManager?.distanceFilter = 50
		locationManager?.requestAlwaysAuthorization()
		locationManager?.startUpdatingLocation()
	}
	
	
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		self.currentLocation2d = manager.location?.coordinate
		self.currentLocation = manager.location!
		
	}
	
	func getCurrentLocation() -> CLLocation {
		return (locationManager?.location)!
	}
}

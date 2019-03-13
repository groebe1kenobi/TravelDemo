//
//  ViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 2/5/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
	
	@IBOutlet weak var mapView: MKMapView!
	@IBOutlet weak var sideMenuButton: UIButton!
	@IBOutlet weak var viewAllButton: UIButton!
	@IBOutlet weak var buttonBackgroundView: UIView!
	@IBOutlet weak var discoverButton: UIButton!
	
	
	//var landmarks: [Landmark] = []
	private var currLandmarkIndex = 0
	private var currLandmarkData: [Landmark]?
	private var landmarks = [Landmark]()
	let regionRadius: CLLocationDistance = 1000
	let distanceOp = DistanceOperators()


	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("MAP VIEW TEST \(globalUser?.firstName ?? "Fail")")
		// set initial location in Wriglwy
		let initialLocation = CLLocation(latitude: 41.787663516, longitude: -87.576331028 )
		
		centerMapOnLocation(location: initialLocation)
		mapView.delegate = self
		
		mapView.register(ArtworkView.self,
						 forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
		
		landmarks = LibraryAPI.shared.getLandmark()

		
		for mark in landmarks {
			let distance = distanceOp.getDistance(mark.coordinate, initialLocation)
			DispatchQueue.main.async {
				self.mapView.addAnnotation(mark)
				
				self.mapView.reloadInputViews()
				//print("\(mark.title ?? "")")
				
				print("\(mark.title ?? "MIssing location") is aprox: \(distance) away from you!")
			
			}
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: animated)
		buttonBackgroundView.layer.cornerRadius = 10
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(false, animated: animated)
	}
	
	
	
	func centerMapOnLocation(location: CLLocation) {
		let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
												  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
		mapView.setRegion(coordinateRegion, animated: true)
	}
	
	
	

	
}

extension MapViewController: MKMapViewDelegate {
	
	func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
				 calloutAccessoryControlTapped control: UIControl) {
		let location = view.annotation as! Landmark
		
		let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving] // currently driving directions
		
		if(control == view.leftCalloutAccessoryView) {
			performSegue(withIdentifier: "mapTest", sender: nil)
		} else if(control == view.rightCalloutAccessoryView) {
			location.mapItem().openInMaps(launchOptions: launchOptions)
		} else {
			print("gooofed")
		}
		
	}
	
}

class DistanceOperators {
	func getDistance(_ landmarkLoc: CLLocationCoordinate2D, _ userLoc: CLLocation) -> Double {
		
		
		let landLat: CLLocationDegrees = landmarkLoc.latitude
		let landLon: CLLocationDegrees = landmarkLoc.longitude
		
		let convertedLoc: CLLocation = CLLocation(latitude: landLat, longitude: landLon)
		
		let distance = convertedLoc.distance(from: userLoc) / 1000
		
		return round(distance * 0.62137)
	}
}

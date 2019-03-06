//
//  ViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 2/5/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import MapKit

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
			
			DispatchQueue.main.async {
				self.mapView.addAnnotation(mark)
				self.mapView.reloadInputViews()
				print("\(mark.title ?? "")")

			}
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: animated)
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


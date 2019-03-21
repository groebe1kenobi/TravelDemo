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

class MapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	@IBOutlet weak var mapView: MKMapView!
	@IBOutlet weak var sideMenuButton: UIButton!
	@IBOutlet weak var cameraButton: UIButton!

	
	
	//var landmarks: [Landmark] = []
	private var currLandmarkIndex = 0
	private var currLandmarkData: [Landmark]?
	private var landmarks = [Landmark]()
	let regionRadius: CLLocationDistance = 1000
	let distanceOp = DistanceOperators()
	let imagePicker = UIImagePickerController()
	var imageToSend: UIImage?
	let yelp = CDYelpFusionKitManager()
	var selectedLandmark: Landmark?
	
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		//let tabBar = tabBarController as! GlobalTabBarController
		// set initial location in Wriglwy
		let initialLocation = CLLocation(latitude: 41.787663516, longitude: -87.576331028 )
		
		centerMapOnLocation(location: initialLocation)
		mapView.delegate = self
		
		mapView.register(LandmarkAnnotationView.self,
						 forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
		
		landmarks = LibraryAPI.shared.getLandmark()
		
		CDYelpFusionKitManager.shared.apiClient.fetchBusiness(forId: "KbZ9cSMoAIsTWASs6m5mJw", locale: nil) { (data) in
			if let data = data {
				print(data.name!)
			}
			
		}

		
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
		
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillAppear(animated)
		//navigationController?.setNavigationBarHidden(false, animated: animated)
	}
	
	
	func centerMapOnLocation(location: CLLocation) {
		let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
												  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
		mapView.setRegion(coordinateRegion, animated: true)
	}
	
	@IBAction func openCameraButton(_ sender: UIButton) {
		if UIImagePickerController.isSourceTypeAvailable(.camera) {
			
			imagePicker.delegate = self
			imagePicker.sourceType = .camera
			imagePicker.allowsEditing = false
			self.present(imagePicker, animated: true, completion: nil)
		}
	}
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if (segue.identifier == "mapToCamera") {
			if let destinationVC = segue.destination as? CameraViewController {
				destinationVC.imageToShow = imageToSend
				
			}
		}
		
		if (segue.identifier == "mapToLandmark") {
			if let destinationVC = segue.destination as? LandmarkViewController {
				destinationVC.landmark = selectedLandmark
			}
		}
	}
	func imagePickerController(_ picker: UIImagePickerController,
							   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		imagePicker.dismiss(animated: true, completion: nil)
		guard let selectedImage = info[.originalImage] as? UIImage else {
			fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
		}
		imageToSend = selectedImage
		self.performSegue(withIdentifier: "mapToCamera", sender: self)
		//imageView.image = selectedImage
	}
	

	
}

extension MapViewController: MKMapViewDelegate {
	
	func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
				 calloutAccessoryControlTapped control: UIControl) {
		let location = view.annotation as! Landmark
		
		let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving] // currently driving directions
		
		if(control == view.leftCalloutAccessoryView) {
			selectedLandmark = location
			self.performSegue(withIdentifier: "mapToLandmark", sender: nil)
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

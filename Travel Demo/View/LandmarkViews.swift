//
//  LandmarkMarkerView.swift
//  Travel Demo
//
//  Created by Sean Groebe on 2/6/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import MapKit

class LandmarkMarkerView: MKMarkerAnnotationView {
	override var annotation: MKAnnotation? {
		willSet {
			
			
			// Configures Callout like mapView(_:viewFor:)
			guard let landmark = newValue as? Landmark else {return}
			canShowCallout = true
			calloutOffset = CGPoint(x: -5, y: 5)
			rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
			
			// Set marker's tint color, replace pin icon (glyph) w/ first letter of annotation type
			markerTintColor = landmark.markerTintColor
			
			if let imageName = landmark.imageName {
				glyphImage = UIImage(named: imageName)
			} else {
				glyphImage = nil
			}
		}
	}
}


class ArtworkView: MKAnnotationView {
	override var annotation: MKAnnotation? {
		willSet {
			guard let artwork = newValue as? Landmark else {return}
			canShowCallout = true
			calloutOffset = CGPoint(x: -5, y: 5)
			
			// creates UI Button
			let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero,
													size: CGSize(width: 30, height: 30)))
			// Set button background image to Maps Icon
			mapsButton.setBackgroundImage(UIImage(named: "Maps-icon"), for: UIControl.State())
			
			// Set right calloutView to this button
			rightCalloutAccessoryView = mapsButton
			leftCalloutAccessoryView = UIButton(type: .detailDisclosure)

			if let imageName = artwork.imageName {
				image = UIImage(named: imageName)
			} else {
				image = UIImage(named: "skiMask")
			}
		}
	}
}

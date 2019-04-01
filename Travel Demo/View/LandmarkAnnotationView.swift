//
//  LandmarkMarkerView.swift
//  Travel Demo
//
//  Created by Sean Groebe on 2/6/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import MapKit

let my = MyColors()
class LandmarkAnnotationView: MKAnnotationView {
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
				switch imageName {
				case "pizza":
					let pinImage = UIImage(named: imageName)
					//image = pinImage?.maskWithColor(color: my.lightOrange)
					image = pinImage?.tint(with: my.lightOrange)
				case "building":
					let pinImage = UIImage(named: imageName)
					//image = pinImage?.maskWithColor(color: my.purple)
					image = pinImage?.tint(with: my.purple)
				case "ferrisWheel":
					let pinImage = UIImage(named: imageName)
					//image = pinImage?.maskWithColor(color: my.pink)
					image = pinImage?.tint(with: my.pink)
				case "beer":
					let pinImage = UIImage(named: imageName)
					//image = pinImage?.maskWithColor(color: my.orange)
					image = pinImage?.tint(with: my.orange)
				case "leaf":
					let pinImage = UIImage(named: imageName)
					//image = pinImage?.maskWithColor(color: my.green)
					image = pinImage?.tint(with: my.green)
					
				default:
					let pinImage = UIImage(named: imageName)
					let size = CGSize(width: 30, height: 30)
					UIGraphicsBeginImageContext(size)
					pinImage!.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
					let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
					image = resizedImage
				}
				
				
				
				
				
				
			} else {
				image = UIImage(named: "skiMask")
			}
		}
	}
}


extension UIImage {
	func maskWithColor(color: UIColor) -> UIImage? {
		let maskImage = cgImage!
		
		let width = size.width
		let height = size.height
		let bounds = CGRect(x: 0, y: 0, width: width, height: height)
		let colorSpace = CGColorSpaceCreateDeviceRGB()
		let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
		let context = CGContext(data: nil, width: Int(width), height: Int(height),  bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
		context.clip(to: bounds, mask: maskImage)
		context.setFillColor(color.cgColor)
		context.fill(bounds)
		if let cgImage = context.makeImage() {
			let coloredImage = UIImage(cgImage: cgImage)
			return coloredImage
		} else {
			return nil
		}
	}
	
	
	func tint(with color: UIColor) -> UIImage {
		var image = withRenderingMode(.alwaysTemplate)
		UIGraphicsBeginImageContextWithOptions(size, false, scale)
		color.set()
		
		image.draw(in: CGRect(origin: .zero, size: size))
		image = UIGraphicsGetImageFromCurrentImageContext()!
		UIGraphicsEndImageContext()
		return image
	}

}

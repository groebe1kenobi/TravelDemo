//
//  ImageView.swift
//  Travel Demo
//
//  Created by Sean Groebe on 2/14/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import Foundation

import UIKit

class AlbumView: UIView {
	
	private var landmarkImageView: UIImageView!
	private var indicatorView: UIActivityIndicatorView!
	private var valueObservation: NSKeyValueObservation!
	
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	init(frame: CGRect, coverUrl: String) {
		super.init(frame: frame)
		commonInit()
		
		// Sends notification through NotificationCenter singleton
		// Notification info contains UIImageView to populate & the URL of cover to be downloaded
		NotificationCenter.default.post(name: .BLDownloadImage, object: self, userInfo: ["imageView": landmarkImageView, "imageUrl" : coverUrl])
		
	}
	
	private func commonInit() {
		// Setup the background
		backgroundColor = .black
		// Create the cover image view
		landmarkImageView = UIImageView()
		landmarkImageView.translatesAutoresizingMaskIntoConstraints = false
		
		// adds IV as observer for image property of cover image
		// (key path expr. form: \<type>.<property>.<subproperty>
		valueObservation = landmarkImageView.observe(\.image, options: [.new]) { [unowned self] observed, change in
			if change.newValue is UIImage {
				self.indicatorView.stopAnimating()
			}
		}
		
		addSubview(landmarkImageView)
		// Create the indicator view
		indicatorView = UIActivityIndicatorView()
		indicatorView.translatesAutoresizingMaskIntoConstraints = false
		indicatorView.style = .whiteLarge
		indicatorView.startAnimating()
		addSubview(indicatorView)
		
		NSLayoutConstraint.activate([
			landmarkImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
			landmarkImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
			landmarkImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
			landmarkImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
			indicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			indicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
			])
	}
	
	func highlightAlbum(_ didHighlightView: Bool) {
		if didHighlightView == true {
			backgroundColor = .white
		} else {
			backgroundColor = .black
		}
	}
	
}

extension Notification.Name {
	static let BLDownloadImage = Notification.Name("BLDownloadImageNotification")
}

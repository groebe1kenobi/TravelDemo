//
//  LandmarkDataSource.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/28/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import Foundation
import UIKit
class LandmarkDataSource: NSObject {
	
	private var landmarks = [Landmark]()
	private let tableView: UITableView
	private let refreshControl = UIRefreshControl()
	let my = MyColors()
	init(tableView: UITableView, landmarks: [Landmark]) {
		self.tableView = tableView
		self.landmarks = landmarks
		super.init()
		tableView.dataSource = self
		tableView.reloadData()
	}
	
	
}

extension LandmarkDataSource: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return landmarks.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let landmark = landmarks[indexPath.row]
		var color: UIColor = my.purple
		let cell = tableView.dequeueReusableCell(withIdentifier: LandmarkCell.reuseIdentifier, for: indexPath)
		//let landmark = landmarks[indexPath.row]
		
		
		cell.layer.borderWidth = 8.0
		cell.layer.borderColor = my.purple.cgColor
		
		if landmark.type == "Sport" {
			color = my.orange
		} else if landmark.type == "Restaurant" {
			color = my.lightOrange
		} else if landmark.type == "Drink" {
			color = my.lightPink
		} else if landmark.type == "Nature" {
			color = my.lightGreen
		} else if landmark.type == "Museum" {
			color = my.blue
		} else if landmark.type == "Entertainment" {
			color = my.pink
		} else {
			color = my.lightPurple
		}
		cell.contentView.backgroundColor = color
		configure(cell: cell, indexPath: indexPath)
		
		
		return cell
	}
	
	
	private func configure(cell: UITableViewCell, indexPath: IndexPath) {
		if let cell = cell as? LandmarkCell {
			let object = landmarks[indexPath.row]
			cell.configure(object: object)
		}
	}
	
	
}

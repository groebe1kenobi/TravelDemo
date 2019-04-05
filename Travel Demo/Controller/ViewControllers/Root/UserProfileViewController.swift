//
//  UserProfileViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/4/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
	
	

	@IBOutlet weak var profilePicImageView: UIImageView!
	@IBOutlet weak var segControl: UISegmentedControl!
	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var userName: UILabel!
	
	var stateController = StateController.shared
	
	let my = MyColors()
	private lazy var toVisitViewController: ToVisitViewController = {
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let viewController = storyboard.instantiateViewController(withIdentifier: "ToVisit") as! ToVisitViewController
		self.add(asChildViewController: viewController)
		return viewController
	}()
	
	private lazy var statsViewController: UserStatsCollectionViewController = {
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let viewController = storyboard.instantiateViewController(withIdentifier: "StatsCollection") as! UserStatsCollectionViewController
		self.add(asChildViewController: viewController)
		return viewController
	}()
	

	var myLandmarks: [Landmark]?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//profilePicImageView.image = currentUser.proPic
		userName.text = "\(currentUser.firstName ?? "First") \(currentUser.lastName ?? "Last")"
		setupView()
		
		
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(false, animated: animated)
		
		segControl.backgroundColor = my.blue
		segControl.tintColor = my.lightPink
		
		//myLandmarks = LibraryAPI.shared.getSavedLandmarks()
		//myLandmarks = stateController.getSavedLandmarks()
		
		ImageService.getImage(withURL: currentUser.fbProPicURL!) { image in
			self.profilePicImageView.image = image
		}
		
		
	}
	
	private func setupView() {
		setupSegmentedControl()
		updateView()
	}
	
	private func setupSegmentedControl() {
		
		let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		segControl.removeAllSegments()
		segControl.insertSegment(withTitle: "ToVisit", at: 0, animated: false)
		segControl.insertSegment(withTitle: "Stats", at: 1, animated: false)
		segControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
		
		segControl.selectedSegmentIndex = 0
		segControl.setTitleTextAttributes(textAttributes, for: .normal)
		segControl.setTitleTextAttributes(textAttributes, for: .selected)
	}
	
	@objc func selectionDidChange(_ sender: UISegmentedControl) {
		updateView()
	}
	
	func updateView() {
		if segControl.selectedSegmentIndex == 0 {
			remove(asChildViewController: statsViewController)
			add(asChildViewController: toVisitViewController)
		} else {
			remove(asChildViewController: toVisitViewController)
			add(asChildViewController: statsViewController)
		}
	}
	
	private func add(asChildViewController viewController: UIViewController) {
		addChild(viewController) // add child vc
		containerView.addSubview(viewController.view) // add child vc as subview
		
		// Configure child view
		viewController.view.frame = containerView.bounds
		viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		
		// notify child view controller
		viewController.didMove(toParent: self)
	}
	
	private func remove(asChildViewController viewController: UIViewController) {
		viewController.willMove(toParent: nil) 	// Notify Child VC

		viewController.view.removeFromSuperview() // Remove child view from superview
		viewController.removeFromParent() // notify child vc
	}
}

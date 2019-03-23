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
	
	
	private lazy var toVisitViewController: ToVisitTableViewController = {
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let viewController = storyboard.instantiateViewController(withIdentifier: "ToVisitTableView") as! ToVisitTableViewController
		self.add(asChildViewController: viewController)
		return viewController
	}()
	
	private lazy var secondViewController: SecondViewController = {
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let viewController = storyboard.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
		self.add(asChildViewController: viewController)
		return viewController
	}()
	
	var myLandmarks = [Landmark]()
	
	//private var landmarkTableViewController: ToVisitTableViewController?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		profilePicImageView.image = currentUser.proPic
		
		setupView()
		
		
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(false, animated: animated)
		
		myLandmarks = LibraryAPI.shared.getSavedLandmarks()
		
		for landmark in myLandmarks {
			print(landmark.title!)
		}
		
		//defaults.getUserDefaults()
	}
	
	private func setupView() {
		setupSegmentedControl()
		updateView()
	}
	
	private func setupSegmentedControl() {
		segControl.removeAllSegments()
		segControl.insertSegment(withTitle: "ToVisit", at: 0, animated: false)
		segControl.insertSegment(withTitle: "Photos", at: 1, animated: false)
		segControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
		
		segControl.selectedSegmentIndex = 0
	}
	
	@objc func selectionDidChange(_ sender: UISegmentedControl) {
		updateView()
	}
	
	func updateView() {
		if segControl.selectedSegmentIndex == 0 {
			remove(asChildViewController: secondViewController)
			add(asChildViewController: toVisitViewController)
		} else {
			remove(asChildViewController: toVisitViewController)
			add(asChildViewController: secondViewController)
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

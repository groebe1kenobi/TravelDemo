//
//  CameraViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/14/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var retakeButton: UIButton!
	
	@IBOutlet weak var savePhotoButton: UIButton!
	
	var imageToShow: UIImage?
	let imagePicker = UIImagePickerController()
	var firstLoad: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		retakeButton.backgroundColor = myBlue
		retakeButton.setTitleColor(myPurple, for: .normal)
		
		savePhotoButton.backgroundColor = myBlue
		savePhotoButton.setTitleColor(myPink, for: .normal)
		
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		navigationController?.setNavigationBarHidden(false, animated: animated)
		imageView.image = imageToShow ?? UIImage(named: "baseball")
	}
	
	
	
}

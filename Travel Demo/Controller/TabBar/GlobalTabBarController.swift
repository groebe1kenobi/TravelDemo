//
//  GlobalTabBarController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/20/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class GlobalTabBarController: UITabBarController {
	
	let my = MyColors()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		tabBar.barTintColor = my.purple
		tabBar.isTranslucent = false
		
		//tabBar.selectedItem?.badgeColor = my.orange
		tabBar.unselectedItemTintColor = my.lightOrange
		
		
		
        // Do any additional setup after loading the view.
    }
    

	

}

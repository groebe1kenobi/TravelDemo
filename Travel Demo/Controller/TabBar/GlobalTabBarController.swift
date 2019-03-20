//
//  GlobalTabBarController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/20/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class GlobalTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		tabBar.barTintColor = myBlue
		tabBar.isTranslucent = false
		
		
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

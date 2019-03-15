//
//  AppDelegate.swift
//  Travel Demo
//
//  Created by Sean Groebe on 2/5/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
//import Firebase
import FBSDKCoreKit

let myBlue: UIColor = UIColor(red: 0/255, green: 168/255, blue: 181/255, alpha: 1.0)
let myPurple: UIColor = UIColor(red: 119/255, green: 72/255, blue: 152/255, alpha: 1.0)
let myOrange: UIColor = UIColor(red: 243/255, green: 174/255, blue: 75/255, alpha: 1.0)
let myPink: UIColor = UIColor(red: 222/255, green: 67/255, blue: 131/255, alpha: 1.0)

let currentUser: CurrentUser = CurrentUser.sharedInstance
let defaults = UserDefaults.standard
let fbLoginButton: LoginButton = LoginButton(readPermissions: [.publicProfile, .email])
let fbLoginManager: LoginManager = LoginManager()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	
	
	
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
		return true
		
	}
	
	func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
		return SDKApplicationDelegate.shared.application(app, open: url, options: options)
	}
		
	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
		
		defaults.saveUserDefaults()
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}



}


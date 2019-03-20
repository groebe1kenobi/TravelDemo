//
//  CoreDataHelper.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/20/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper {
	var landmarks: [NSManagedObject] = []
	var container: NSPersistentContainer!
	
	func save(_ landmarkName: String) {
		guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
			return
		}
		
		// Needed to access NSManagedObjectContext (in-memory "scratchpad" for working with managed objects)
		// Saving a new mangdContext is a 2 step process:
		// 1. Insert new managed Object into managedObjectContext
		// 2. commit the changes in managedObjectContext to save to disk
		let managedContext = appDelegate.persistentContainer.viewContext
		
		
		// Create new managedObject and insert it into ManagedObjectContext
		// NSEntityDescription = links entity definition from Data Model with instance of NSManagedObject at runtime
		let entity = NSEntityDescription.entity(forEntityName: "LandmarkCD", in: managedContext)!
		
		let landmark = NSManagedObject(entity: entity, insertInto: managedContext)
		
		landmark.setValue(landmarkName, forKeyPath: "title")
		
		do {
			try managedContext.save() // save object to disk
			//landmarks.append(landmark) // insert into record to appear later4
			currentUser.cdLandmarks.append(landmark)
		} catch let error as NSError {
			print("Could not save. \(error), \(error.userInfo)")
		}
	}
	
	func fetch() {
		guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
			return
		}
		let managedContext = appDelegate.persistentContainer.viewContext
		let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LandmarkCD")
		
		do {
			currentUser.cdLandmarks = try managedContext.fetch(fetchRequest)
		} catch let error as NSError {
			print("Could not save. \(error), \(error.userInfo)")
		}
		
	}
	
}

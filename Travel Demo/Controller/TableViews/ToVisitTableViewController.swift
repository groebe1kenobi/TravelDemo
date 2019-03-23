//
//  ToVisitTableViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/23/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class ToVisitTableViewController: UITableViewController {

	var landmarks = [Landmark]()
    override func viewDidLoad() {
        super.viewDidLoad()

//		tableView.rowHeight = UITableView.automaticDimension
//		tableView.estimatedRowHeight = 152
		
		landmarks = LibraryAPI.shared.getSavedLandmarks()
		//tableView.dataSource = self
		tableView.delegate = self
		
		tableView.reloadData()
		
    }
	

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
		
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return landmarks.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toVisitCell", for: indexPath) as! LandmarkListTableViewCell
		let validIndex = landmarks[indexPath.row].title
		if validIndex != nil {
			
			cell.locationLabel.adjustsFontSizeToFitWidth = true
			cell.locationDistanceLabel.adjustsFontSizeToFitWidth = true
			cell.locationLabel.text = landmarks[indexPath.row].title
			cell.locationDistanceLabel.text = landmarks[indexPath.row].name
			ImageService.getImage(withURL: landmarks[indexPath.row].imageUrl) { image in
				cell.backgroundView = UIImageView(image: image)
			}
		}

		return cell
    }
	

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

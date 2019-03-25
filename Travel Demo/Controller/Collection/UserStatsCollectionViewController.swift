//
//  UserStatsCollectionViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/25/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit



class UserStatsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

	

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
		
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! StatsCell
		
		switch indexPath.row {
		case 0:
			cell.iconImageView.image = UIImage(named: "restaurant")
			cell.categoryLabel.text = "Food"
			cell.completionLabel.text = "\(currentUser.foodVisited) / 8"
		case 1:
			cell.iconImageView.image = UIImage(named: "cocktail")
			cell.categoryLabel.text = "Drink"
			cell.completionLabel.text = "\(currentUser.drinkVisited) / 10"
		case 2:
			cell.iconImageView.image = UIImage(named: "circus")
			cell.categoryLabel.text = "Entertainment"
			cell.completionLabel.text = "\(currentUser.entertainmentVisited) / 5"
		case 3:
			cell.iconImageView.image = UIImage(named: "nature")
			cell.categoryLabel.text = "Nature"
			cell.completionLabel.text = "\(currentUser.natureVisited) / 3"
		case 4:
			cell.iconImageView.image = UIImage(named: "museum")
			cell.categoryLabel.text = "Museum"
			cell.completionLabel.text = "\(currentUser.museumVisited) / 8"
		default:
			print("Shouldn't get here")
			
		}
		
    
        
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

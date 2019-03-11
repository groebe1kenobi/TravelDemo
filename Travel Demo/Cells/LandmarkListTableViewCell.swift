//
//  LandmarkListTableViewCell.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/6/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class LandmarkListTableViewCell: UITableViewCell {
	
	@IBOutlet var locationLabel: UILabel!
	@IBOutlet var locationDistanceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

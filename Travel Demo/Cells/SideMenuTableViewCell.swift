//
//  SideMenuTableViewCell.swift
//  Travel Demo
//
//  Created by Sean Groebe on 2/15/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

	@IBOutlet weak var iconImageView: UIImageView!
	@IBOutlet weak var optionLabel: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

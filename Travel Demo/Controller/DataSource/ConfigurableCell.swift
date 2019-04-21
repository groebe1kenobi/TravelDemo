//
//  ConfigurableCell.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/28/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import Foundation

protocol ConfigurableCell {
	associatedtype Object
	func configure(object: Object)
}

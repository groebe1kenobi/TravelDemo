//
//  ReusableIdentifier.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/28/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import Foundation

protocol ReusableIdentifier: class {
	static var reuseIdentifier: String {get}
}

extension ReusableIdentifier {
	static var reuseIdentifier: String {
		return "\(self)"
	}
}

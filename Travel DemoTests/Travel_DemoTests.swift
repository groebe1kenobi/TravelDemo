//
//  Travel_DemoTests.swift
//  Travel DemoTests
//
//  Created by Sean Groebe on 3/20/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import XCTest
@testable import Travel_Demo

class Travel_DemoTests: XCTestCase {
	
	//var mapTest: MapViewController!
	var landmarkAdd: LandmarkViewController!
    override func setUp() {
		super.setUp()
		landmarkAdd = LandmarkViewController()
		landmarkAdd.addLandmarkButton(UIButton())
		//mapTest = MapViewController()
		//mapTest.placeAnnotations()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		//mapTest = nil
		landmarkAdd = nil
		super.tearDown()
    }

	

	

}

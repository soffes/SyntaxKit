//
//  ColorTests.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/15/15.
//  Copyright © 2015 Sam Soffes. All rights reserved.
//

import XCTest
@testable import SyntaxKit

class ColorTests: XCTestCase {
	func testHex() {
		assertEqualColors(Color(red: 1, green: 0, blue: 0, alpha: 1), Color(hex: "#f00")!)
		assertEqualColors(Color(red: 0.984, green: 0.690, blue: 0.204, alpha: 1), Color(hex: "#fbb034")!)
		assertEqualColors(Color(red: 1, green: 0.867, blue: 0, alpha: 1), Color(hex: "#fd0")!)
		assertEqualColors(Color(red: 0.757, green: 0.847, blue: 0.184, alpha: 1), Color(hex: "0xc1d82f")!)
		assertEqualColors(Color(red: 0, green: 0.647, blue: 0.894, alpha: 1), Color(hex: "00a4e4ff")!)
		assertEqualColors(Color(red: 0.541, green: 0.475, blue: 0.404, alpha: 0), Color(hex: "8a796700")!)
	}
}

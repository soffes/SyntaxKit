//
//  TestHelper.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/15/15.
//  Copyright © 2015 Sam Soffes. All rights reserved.
//

import Foundation
import XCTest
import X
@testable import SyntaxKit

func fixture(name: String, _ type: String) -> String! {
	let path = NSBundle(forClass: LanguageTests.self).pathForResource(name, ofType: type)!
	return try! String(contentsOfFile: path)
}

func language(name: String) -> Language! {
	let path = NSBundle(forClass: LanguageTests.self).pathForResource(name, ofType: "tmLanguage")!
	let plist = NSDictionary(contentsOfFile: path)! as [NSObject: AnyObject]
	return Language(dictionary: plist)!
}

func theme(name: String) -> Theme! {
	let path = NSBundle(forClass: LanguageTests.self).pathForResource(name, ofType: "tmTheme")!
	let plist = NSDictionary(contentsOfFile: path)! as [NSObject: AnyObject]
	return Theme(dictionary: plist)!
}

func simpleTheme() -> Theme! {
	return Theme(dictionary: [
		"uuid": "7",
		"name": "Simple",
		"settings": [
			[
				"scope": "entity.name",
				"settings": [
					"color": "blue"
				]
			],
			[
				"scope": "string",
				"settings": [
					"color": "red"
				]
			],
			[
				"scope": "constant.numeric",
				"settings": [
					"color": "purple"
				]
			]
		]
	])
}

#if os(iOS)
import UIKit
extension Color {
	var redComponent: CGFloat {
		var value: CGFloat = 0.0
		getRed(&value, green: nil, blue: nil, alpha: nil)
		return value
	}

	var greenComponent: CGFloat {
		var value: CGFloat = 0.0
		getRed(nil, green: &value, blue: nil, alpha: nil)
		return value
	}

	var blueComponent: CGFloat {
		var value: CGFloat = 0.0
		getRed(nil, green: nil, blue: &value, alpha: nil)
		return value
	}

	var alphaComponent: CGFloat {
		var value: CGFloat = 0.0
		getRed(nil, green: nil, blue: nil, alpha: &value)
		return value
	}
}
#endif

func assertEqualColors(color1: Color, _ color2: Color, accuracy: CGFloat = 0.005) {
	XCTAssertEqualWithAccuracy(color1.redComponent, color2.redComponent, accuracy: accuracy)
	XCTAssertEqualWithAccuracy(color1.greenComponent, color2.greenComponent, accuracy: accuracy)
	XCTAssertEqualWithAccuracy(color1.blueComponent, color2.blueComponent, accuracy: accuracy)
	XCTAssertEqualWithAccuracy(color1.alphaComponent, color2.alphaComponent, accuracy: accuracy)
}

extension NSRange: Equatable { }

public func ==(lhs: NSRange, rhs: NSRange) -> Bool {
	return lhs.location == rhs.location && lhs.length == rhs.length
}

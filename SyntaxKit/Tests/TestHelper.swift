//
//  TestHelper.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/15/15.
//  Copyright © 2015 Sam Soffes. All rights reserved.
//

import Foundation
import SyntaxKit

func yamlLanguage() -> Language! {
	let path = NSBundle(forClass: LanguageTests.self).pathForResource("YAML", ofType: "tmLanguage")!
	let plist = NSDictionary(contentsOfFile: path)! as [NSObject: AnyObject]
	return Language(dictionary: plist)!
}

func tomorrowTheme() -> Theme! {
	let path = NSBundle(forClass: LanguageTests.self).pathForResource("Tomorrow", ofType: "tmTheme")!
	let plist = NSDictionary(contentsOfFile: path)! as [NSObject: AnyObject]
	return Theme(dictionary: plist)!
}

func simpleTheme() -> Theme! {
	return Theme(dictionary: [
		"uuid": "7",
		"name": "Simple",
		"settings": [
			"entity.name": [
				"color": "blue"
			],
			"string": [
				"color": "red"
			],
			"constant.numeric": [
				"color": "purple"
			]
		]
	])
}


extension NSRange: Equatable { }

public func ==(lhs: NSRange, rhs: NSRange) -> Bool {
	return lhs.location == rhs.location && lhs.length == rhs.length
}

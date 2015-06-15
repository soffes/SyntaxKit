//
//  LanguageTests.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/5/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

import XCTest
import SyntaxKit

class LanguageTests: XCTestCase {

	// MARK: - Properties

	let yaml: Language = {
		let path = NSBundle(forClass: LanguageTests.self).pathForResource("YAML", ofType: "plist")!
		let plist = NSDictionary(contentsOfFile: path)! as [NSObject: AnyObject]
		return Language(dictionary: plist)!
	}()


	// MARK: - Tests

	func testLoading() {
		XCTAssertEqual("B0C44228-4F1F-11DA-AFF2-000A95AF0064", yaml.UUID)
		XCTAssertEqual("YAML", yaml.name)
		XCTAssertEqual("source.yaml", yaml.scopeName)

		XCTAssertEqual("meta.embedded.line.ruby", yaml.patterns[0].name)
		XCTAssertEqual("string.unquoted.block.yaml", yaml.patterns[1].name)
		XCTAssertEqual("constant.numeric.yaml", yaml.patterns[2].name)

		let pattern = yaml.patterns[3]
		XCTAssertEqual("string.unquoted.yaml", pattern.name)
		XCTAssertEqual("punctuation.definition.entry.yaml", pattern.captures![1]!.name)
	}
}

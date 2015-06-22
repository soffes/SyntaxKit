//
//  LanguageTests.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 9/18/14.
//  Copyright © 2014-2015 Sam Soffes. All rights reserved.
//

import XCTest
@testable import SyntaxKit

class LanguageTests: XCTestCase {

	// MARK: - Properties

	let yaml = language("YAML")


	// MARK: - Tests

	func testLoading() {
		XCTAssertEqual("B0C44228-4F1F-11DA-AFF2-000A95AF0064", yaml.UUID)
		XCTAssertEqual("YAML", yaml.name)
		XCTAssertEqual("source.yaml", yaml.scopeName)

		XCTAssertEqual("meta.embedded.line.ruby", yaml.patterns[0].name!)
		XCTAssertEqual("string.unquoted.block.yaml", yaml.patterns[1].name!)
		XCTAssertEqual("constant.numeric.yaml", yaml.patterns[2].name!)

		let pattern = yaml.patterns[3]
		XCTAssertEqual("string.unquoted.yaml", pattern.name!)
		XCTAssertEqual("punctuation.definition.entry.yaml", pattern.captures![1]!.name)
	}
}

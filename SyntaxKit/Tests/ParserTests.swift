//
//  ParserTests.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/15/15.
//  Copyright © 2015 Sam Soffes. All rights reserved.
//

import XCTest
import SyntaxKit

class ParserTests: XCTestCase {

	// MARK: - Properties

	let parser = Parser(language: language("YAML"))


	// MARK: - Tests

	func testParsingBeginEnd() {
		var stringQuoted: NSRange?
		var punctuationBegin: NSRange?
		var punctuationEnd: NSRange?

		parser.parse("title: \"Hello World\"\n") { scope, range in
			if stringQuoted == nil && scope.hasPrefix("string.quoted.double") {
				stringQuoted = range
			}
		
			if punctuationBegin == nil && scope.hasPrefix("punctuation.definition.string.begin") {
				punctuationBegin = range
			}
		
			if punctuationEnd == nil && scope.hasPrefix("punctuation.definition.string.end") {
				punctuationEnd = range
			}
		}
	
		XCTAssertEqual(NSMakeRange(7, 13), stringQuoted!)
		XCTAssertEqual(NSMakeRange(7, 1), punctuationBegin!)
		XCTAssertEqual(NSMakeRange(19, 1), punctuationEnd!)
	}

	func testParsingBeginEndCrap() {
		var stringQuoted: NSRange?

		parser.parse("title: Hello World\ncomments: 24\nposts: \"12\"zz\n") { scope, range in
			if stringQuoted == nil && scope.hasPrefix("string.quoted.double") {
				stringQuoted = range
			}
		}
	
		XCTAssertEqual(NSMakeRange(39, 4), stringQuoted!)
	}

	func testRuby() {
		let parser = Parser(language: language("Ruby"))
		let input = fixture("test.rb", "txt")
		parser.parse(input, match: { _, _ in return })
	}
}

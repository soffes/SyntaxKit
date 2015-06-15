//
//  SyntaxKitTests.swift
//  SyntaxKitTests
//
//  Created by Sam Soffes on 9/19/14.
//  Copyright © 2014-2015 Sam Soffes. All rights reserved.
//

import XCTest
import SyntaxKit

class SyntaxKitTests: XCTestCase {

	// MARK: - Properties

	var parser = AttributedParser(language: yamlLanguage(), theme: simpleTheme())


	// MARK: - Tests

	func testParsing() {
		let string = parser.attributedStringForString("title: Hello World\ncount: 42\n")

		XCTAssertEqual(["color": "blue"] as NSDictionary, string.attributesAtIndex(0, effectiveRange: nil) as NSDictionary)
		XCTAssertEqual(["color": "red"] as NSDictionary, string.attributesAtIndex(7, effectiveRange: nil) as NSDictionary)
		XCTAssertEqual(["color": "blue"] as NSDictionary, string.attributesAtIndex(19, effectiveRange: nil) as NSDictionary)
		XCTAssertEqual(["color": "purple"] as NSDictionary, string.attributesAtIndex(25, effectiveRange: nil) as NSDictionary)
	}

	func testParsingBeginEnd() {
//	__block NSRange stringQuoted = NSMakeRange(NSNotFound, 0);
//	__block NSRange punctuationBegin = NSMakeRange(NSNotFound, 0);
//	__block NSRange punctuationEnd = NSMakeRange(NSNotFound, 0);
//
//	NSString *input = "title: \"Hello World\"\n";
//	[self.parser parse:input match:^(NSString *scope, NSRange range) {
//	if (stringQuoted.location == NSNotFound && [scope hasPrefix:"string.quoted.double"]) {
//	stringQuoted = range;
//	}
//
//	if (punctuationBegin.location == NSNotFound && [scope hasPrefix:"punctuation.definition.string.begin"]) {
//	punctuationBegin = range;
//	}
//
//	if (punctuationEnd.location == NSNotFound && [scope hasPrefix:"punctuation.definition.string.end"]) {
//	punctuationEnd = range;
//	}
//	}];
//
//	SYNAssertEqualRanges(NSMakeRange(7, 13), stringQuoted);
//	SYNAssertEqualRanges(NSMakeRange(7, 1), punctuationBegin);
//	SYNAssertEqualRanges(NSMakeRange(19, 1), punctuationEnd);
	}

	func testParsingBeginEndCrap() {
//	__block NSRange stringQuoted = NSMakeRange(NSNotFound, 0);
//	NSString *input = "title: Hello World\ncomments: 24\nposts: \"12\"zz\n";
//	[self.parser parse:input match:^(NSString *scope, NSRange range) {
//	if (stringQuoted.location == NSNotFound && [scope hasPrefix:"string.quoted.double"]) {
//	stringQuoted = range;
//	}
//	}];
//
//	SYNAssertEqualRanges(NSMakeRange(39, 4), stringQuoted);
	}
}

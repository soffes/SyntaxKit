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

	let yaml: Language = {
		let path = NSBundle(forClass: LanguageTests.self).pathForResource("YAML", ofType: "plist")!
		let plist = NSDictionary(contentsOfFile: path)! as [NSObject: AnyObject]
		return Language(dictionary: plist)!
	}()

	var parser: AttributedParser!


	// MARK: - XCTestCase

	override func setUp() {
		super.setUp()
		parser = AttributedParser(language: yaml)
	}

//	- (void)setUp {
//	[super setUp];
//	self.parser = [[SYNAttributedParser alloc] initWithLanguageName:@"yaml"];
//	}
//
//
//	- (void)testParsing {
//	[self.parser setAttributes:@{ @"color": @"blue" } forScope:@"entity.name"];
//	[self.parser setAttributes:@{ @"color": @"red" } forScope:@"string"];
//	[self.parser setAttributes:@{ @"color": @"purple" } forScope:@"constant.numeric"];
//
//	NSString *input = @"title: Hello World\ncount: 42\n";
//	NSAttributedString *string = [self.parser attributedStringForString:input];
//
//	XCTAssertEqualObjects([string attributesAtIndex:0 effectiveRange:nil], @{ @"color": @"blue" });
//	XCTAssertEqualObjects([string attributesAtIndex:7 effectiveRange:nil], @{ @"color": @"red" });
//	XCTAssertEqualObjects([string attributesAtIndex:19 effectiveRange:nil], @{ @"color": @"blue" });
//	XCTAssertEqualObjects([string attributesAtIndex:25 effectiveRange:nil], @{ @"color": @"purple" });
//	}
//
//
//	- (void)testParsingBeginEnd {
//	__block NSRange stringQuoted = NSMakeRange(NSNotFound, 0);
//	__block NSRange punctuationBegin = NSMakeRange(NSNotFound, 0);
//	__block NSRange punctuationEnd = NSMakeRange(NSNotFound, 0);
//
//	NSString *input = @"title: \"Hello World\"\n";
//	[self.parser parse:input match:^(NSString *scope, NSRange range) {
//	if (stringQuoted.location == NSNotFound && [scope hasPrefix:@"string.quoted.double"]) {
//	stringQuoted = range;
//	}
//
//	if (punctuationBegin.location == NSNotFound && [scope hasPrefix:@"punctuation.definition.string.begin"]) {
//	punctuationBegin = range;
//	}
//
//	if (punctuationEnd.location == NSNotFound && [scope hasPrefix:@"punctuation.definition.string.end"]) {
//	punctuationEnd = range;
//	}
//	}];
//
//	SYNAssertEqualRanges(NSMakeRange(7, 13), stringQuoted);
//	SYNAssertEqualRanges(NSMakeRange(7, 1), punctuationBegin);
//	SYNAssertEqualRanges(NSMakeRange(19, 1), punctuationEnd);
//	}
//
//
//	- (void)testParsingBeginEndCrap {
//	__block NSRange stringQuoted = NSMakeRange(NSNotFound, 0);
//	NSString *input = @"title: Hello World\ncomments: 24\nposts: \"12\"zz\n";
//	[self.parser parse:input match:^(NSString *scope, NSRange range) {
//	if (stringQuoted.location == NSNotFound && [scope hasPrefix:@"string.quoted.double"]) {
//	stringQuoted = range;
//	}
//	}];
//
//	SYNAssertEqualRanges(NSMakeRange(39, 4), stringQuoted);
//	}
}

//
//  Pattern.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/5/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

import Foundation

public final class Pattern {
//	+ (instancetype)patternWithDictionary:(NSDictionary *)dictionary language:(SYNLanguage *)language {
//	NSString *include = dictionary[@"include"];
//	if (include) {
//	include = [include substringFromIndex:1];
//	return language.repository[include];
//	}
//
//	return [[self alloc] initWithDictionary:dictionary];
//	}


	// MARK: - Properties

	public let name: String
	public let match: String?
	public let beginCaptures: CaptureCollection?
	public let captures: CaptureCollection?
	public let endCaptures: CaptureCollection?
	private weak var parent: Pattern?
	private let patterns: [Pattern]

	public var superpattern: Pattern? {
		return parent
	}

	public var subpatterns: [Pattern] {
		return patterns
	}

	// MARK: - Initializers

	public init?(dictionary: [NSObject: AnyObject], parent: Pattern? = nil) {
		guard let name = dictionary["name"] as? String else {
			self.name = ""
			self.match = nil
			self.beginCaptures = nil
			self.captures = nil
			self.endCaptures = nil
			self.parent = nil
			self.patterns = [Pattern]()
			return nil
		}

		self.parent = parent
		self.name = name
		self.match = dictionary["match"] as? String

		if let dictionary = dictionary["beginCaptures"] as? [NSObject: AnyObject] {
			self.beginCaptures = CaptureCollection(dictionary: dictionary)
		} else {
			self.beginCaptures = nil
		}

		if let dictionary = dictionary["captures"] as? [NSObject: AnyObject] {
			self.captures = CaptureCollection(dictionary: dictionary)
		} else {
			self.captures = nil
		}

		if let dictionary = dictionary["endCaptures"] as? [NSObject: AnyObject] {
			self.endCaptures = CaptureCollection(dictionary: dictionary)
		} else {
			self.endCaptures = nil
		}

		var patterns = [Pattern]()
		if let array = dictionary["patterns"] as? [[NSObject: AnyObject]] {
			for value in array {
				if let pattern = Pattern(dictionary: value, parent: parent) {
					patterns.append(pattern)
				}
			}
		}
		self.patterns = patterns
	}
}

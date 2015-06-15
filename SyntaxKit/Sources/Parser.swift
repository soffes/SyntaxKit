//
//  Parser.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/5/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

import Foundation

public class Parser {

	// MARK: - Types

	public typealias Callback = (scope: String, range: NSRange) -> Void


	// MARK: - Properties

	public let language: Language


	// MARK: - Initializers

	public init(language: Language) {
		self.language = language
	}


	// MARK: - Parsing

	public func parse(string: String, match callback: Callback) {
		// Loop through paragraphs
		let s: NSString = string
		let length = s.length
		var paragraphEnd = 0

		while paragraphEnd < length {
			var paragraphStart = 0
			var contentsEnd = 0
			s.getParagraphStart(&paragraphStart, end: &paragraphEnd, contentsEnd: &contentsEnd, forRange: NSMakeRange(paragraphEnd, 0))

			let paragraphRange = NSMakeRange(paragraphStart, contentsEnd - paragraphStart)
			let limit = NSMaxRange(paragraphRange)
			var range = paragraphRange

			// Loop through the line until we reach the end
			while range.length > 0 && range.location < limit {
				let location = parse(string, inRange: range, callback: callback)
				range.location = Int(location)
				range.length = max(0, range.length - paragraphRange.location - range.location)
			}
		}
	}


	// MARK: - Private

	/// Returns new location
	private func parse(string: String, inRange bounds: NSRange, callback: Callback) -> UInt {
		for pattern in language.patterns {
			// Single pattern
			if let match = pattern.match {
				if let resultSet = parse(string, inRange: bounds, scope: pattern.name, expression: match, captures: pattern.captures) {
					return applyResults(resultSet, callback: callback)
				} else {
					continue
				}

//		// Begin & end
//		if (pattern.begin && pattern.end) {
//		SYNResultSet *begin = [self parse:string inRange:bounds scope:nil expression:pattern.begin captures:pattern.beginCaptures];
//		if (!begin) {
//		continue;
//		}
//
//		NSRange endRange = bounds;
//		endRange.location = NSMaxRange(begin.range);
//		endRange.length -= endRange.location - bounds.location;
//
//		SYNResultSet *end = [self parse:string inRange:endRange scope:nil expression:pattern.end captures:pattern.endCaptures];
//		if (!end) {
//		// TODO: Rewind?
//		continue;
//		}
//
//		SYNResultSet *resultSet = [[SYNResultSet alloc] init];
//
//		// Add whole scope before start and end
//		if (pattern.name) {
//		[resultSet addResultWithScope:pattern.name range:NSUnionRange(begin.range, end.range)];
//		}
//
//		[resultSet addResultsFromResultSet:begin];
//		[resultSet addResultsFromResultSet:end];
//
//		return [self applyResults:resultSet callback:callback];
			}
		}

		return UInt(NSMaxRange(bounds))
	}

	/// Parse an expression with captures
	private func parse(string: String, inRange bounds: NSRange, scope: String, expression expressionString: String, captures: CaptureCollection?) -> ResultSet? {
//		NSRegularExpression *expression = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionAnchorsMatchLines error:nil];
//		NSArray *matches = [expression matchesInString:string options:kNilOptions range:bounds];
//		NSTextCheckingResult *result = [matches firstObject];
//		if (!result) {
//		return nil;
//		}
//
//		SYNResultSet *resultSet = [[SYNResultSet alloc] init];
//		if (scope && result.range.location != NSNotFound) {
//		[resultSet addResultWithScope:scope range:result.range];
//		}
//
//		for (NSNumber *index in [captures captureIndexes]) {
//		NSRange range = [result rangeAtIndex:[index integerValue]];
//		if (range.location == NSNotFound) {
//		continue;
//		}
//
//		scope = [[captures captureAtIndex:[index integerValue]] name];
//		[resultSet addResultWithScope:scope range:range];
//		}
//
//		if (![resultSet isEmpty]) {
//		return resultSet;
//		}

		return nil
	}

	private func applyResults(resultSet: ResultSet, callback: Callback) -> UInt {
		let max: UInt = 0
//		for result in resultSet.results {
//			callback(result.scope, result.range)
//			max = max(NSMaxRange(result.range), max)
//		}
		return max
	}
}

//
//  Parser.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 9/19/14.
//  Copyright © 2014-2015 Sam Soffes. All rights reserved.
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
			}

			// Begin & end
			if let begin = pattern.begin, end = pattern.end {
				guard let beginResults = parse(string, inRange: bounds, expression: begin, captures: pattern.beginCaptures),
					beginRange = beginResults.range else { continue }

				let location = NSMaxRange(beginRange)
				let endBounds = NSMakeRange(location, bounds.length - location - bounds.location)

				guard let endResults = parse(string, inRange: endBounds, expression: end, captures: pattern.endCaptures),
					endRange = endResults.range else { /* TODO: Rewind? */ continue }

				// Add whole scope before start and end
				var results = ResultSet()
				if let name = pattern.name {
					results.addResult(Result(scope: name, range: NSUnionRange(beginRange, endRange)))
				}

				results.addResults(beginResults)
				results.addResults(endResults)

				return applyResults(results, callback: callback)
			}
		}

		return UInt(NSMaxRange(bounds))
	}

	/// Parse an expression with captures
	private func parse(string: String, inRange bounds: NSRange, scope: String? = nil, expression expressionString: String, captures: CaptureCollection?) -> ResultSet? {
		let matches: [NSTextCheckingResult]
		do {
			let expression = try NSRegularExpression(pattern: expressionString, options: [.AnchorsMatchLines])
			matches = expression.matchesInString(string, options: [], range: bounds)
		} catch {
			return nil
		}

		guard let result = matches.first else { return nil }

		var resultSet = ResultSet()
		if let scope = scope where result.range.location != NSNotFound {
			resultSet.addResult(Result(scope: scope, range: result.range))
		}

		if let captures = captures {
			for index in captures.captureIndexes {
				let range = result.rangeAtIndex(Int(index))
				if range.location == NSNotFound {
					continue
				}

				if let scope = captures[index]?.name {
					resultSet.addResult(Result(scope: scope, range: range))
				}
			}
		}

		if !resultSet.isEmpty {
			return resultSet
		}

		return nil
	}

	private func applyResults(resultSet: ResultSet, callback: Callback) -> UInt {
		var i = 0
		for result in resultSet.results {
			callback(scope: result.scope, range: result.range)
			i = max(NSMaxRange(result.range), i)
		}
		return UInt(i)
	}
}

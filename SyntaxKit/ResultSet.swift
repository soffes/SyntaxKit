//
//  ResultSet.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 10/11/14.
//  Copyright © 2014-2015 Sam Soffes. All rights reserved.
//

import Foundation

struct ResultSet {

	// MARK: - Properties

	private var _results = [Result]()
	var results: [Result] {
		return _results
	}

	var range: NSRange?

	var isEmpty: Bool {
		return results.isEmpty
	}


	// MARK: - Adding

	mutating func addResult(result: Result) {
		_results.append(result)

		guard let range = range else {
			self.range = result.range
			return
		}

		self.range = NSUnionRange(range, result.range)
	}

	mutating func addResults(resultSet: ResultSet) {
		for result in resultSet.results {
			addResult(result)
		}
	}
}

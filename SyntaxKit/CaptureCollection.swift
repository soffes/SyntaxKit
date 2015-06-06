//
//  CaptureCollection.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/5/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

struct CaptureCollection {

	// MARK: - Properties

	private let captures: [Int: Capture]

	var captureIndexes: [Int] {
		var keys = captures.keys.array
		keys.sort() { $0 < $1 }
		return keys
	}


	// MARK: - Initializers

	init?(dictionary: [NSObject: AnyObject]) {
		if let dictionary = dictionary as? [Int: [String: String]] {
			var captures = [Int: Capture]()
			for (key, value) in dictionary {
				if let capture = Capture(dictionary: value) {
					captures[key] = capture
				}
			}
			self.captures = captures
		} else {
			return nil
		}
	}


	// MARK: - Accessing Captures

	func captureAtIndex(index: Int) -> Capture? {
		return captures[index]
	}
}

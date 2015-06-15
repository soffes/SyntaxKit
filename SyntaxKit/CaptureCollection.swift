//
//  CaptureCollection.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 9/19/14.
//  Copyright © 2014-2015 Sam Soffes. All rights reserved.
//

import Foundation

struct CaptureCollection {

	// MARK: - Properties

	private let captures: [UInt: Capture]

	var captureIndexes: [UInt] {
		var keys = captures.keys.array
		keys.sortInPlace() { $0 < $1 }
		return keys
	}


	// MARK: - Initializers

	init?(dictionary: [NSObject: AnyObject]) {
		guard let dictionary = dictionary as? [String: [String: String]]  else { return nil }

		var captures = [UInt: Capture]()
		for (key, value) in dictionary {
			if let key = UInt(key), capture = Capture(dictionary: value) {
				captures[key] = capture
			}
		}
		self.captures = captures
	}


	// MARK: - Accessing Captures

	subscript(index: UInt) -> Capture? {
		return captures[index]
	}
}

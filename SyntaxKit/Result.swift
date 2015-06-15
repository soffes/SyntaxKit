//
//  Result.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 10/11/14.
//  Copyright © 2014-2015 Sam Soffes. All rights reserved.
//

import Foundation

struct Result {

	// MARK: - Properties

	let scope: String
	let range: NSRange


	// MARK: - Initializers

	init(scope: String, range: NSRange) {
		self.scope = scope
		self.range = range
	}
}

//
//  Capture.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 9/18/14.
//  Copyright © 2014-2015 Sam Soffes. All rights reserved.
//

import Foundation

struct Capture {

	// MARK: - Properties

	let name: String


	// MARK: - Initializers
	
	init?(dictionary: [NSObject: AnyObject]) {
		guard let name = dictionary["name"] as? String else { return nil }
		self.name = name
	}
}

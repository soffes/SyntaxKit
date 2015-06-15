//
//  Capture.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/5/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

import Foundation

struct Capture {
	let name: String

	init?(dictionary: [NSObject: AnyObject]) {
		guard let name = dictionary["name"] as? String else { return nil }
		self.name = name
	}
}

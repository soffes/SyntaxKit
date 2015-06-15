//
//  Theme.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 10/11/14.
//  Copyright © 2014-2015 Sam Soffes. All rights reserved.
//

import Foundation

public struct Theme {

	// MARK: - Properties

	public let UUID: String
	public let name: String
	public let settings: [String: AnyObject]


	// MARK: - Initializers

	public init?(dictionary: [NSObject: AnyObject]) {
		guard let UUID = dictionary["uuid"] as? String,
			name = dictionary["name"] as? String,
			settings = dictionary["settings"] as? [String: AnyObject]
			else { return nil }

		self.UUID = UUID
		self.name = name
		self.settings = settings
	}
}

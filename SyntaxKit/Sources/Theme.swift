//
//  Theme.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 10/11/14.
//  Copyright © 2014-2015 Sam Soffes. All rights reserved.
//

import Foundation

#if os(OSX)
import AppKit
#else
import UIKit
#endif

public typealias Attributes = [String: AnyObject]

public struct Theme {

	// MARK: - Properties

	public let UUID: String
	public let name: String
	public let settings: [String: Attributes]


	// MARK: - Initializers

	public init?(dictionary: [NSObject: AnyObject]) {
		guard let UUID = dictionary["uuid"] as? String,
			name = dictionary["name"] as? String,
			rawSettings = dictionary["settings"] as? [String: Attributes]
			else { return nil }

		self.UUID = UUID
		self.name = name

		var settings = [String: Attributes]()
		for (scope, attrs) in rawSettings {
			var attributes = attrs

			if let value = attributes.removeValueForKey("foreground") as? String {
				attributes[NSForegroundColorAttributeName] = Color(hex: value)
			}

			if let value = attributes.removeValueForKey("background") as? String {
				attributes[NSBackgroundColorAttributeName] = Color(hex: value)
			}

			// TODO: caret, invisibles, lightHighlight, selection

			settings[scope] = attributes
		}
		self.settings = settings
	}
}

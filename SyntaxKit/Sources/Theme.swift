//
//  Theme.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 10/11/14.
//  Copyright © 2014-2015 Sam Soffes. All rights reserved.
//

import Foundation

public struct Theme {
//	#pragma mark - Factory
//
//	+ (instancetype)themeWithName:(NSString *)name {
//	if (!name) {
//	return nil;
//	}
//
//	static NSCache *themeCache;
//	static dispatch_once_t onceToken;
//	dispatch_once(&onceToken, ^{
//	themeCache = [[NSCache alloc] init];
//	});
//
//	SYNTheme *theme = [themeCache objectForKey:name];
//	if (!theme) {
//	NSString *path = [[NSBundle bundleWithIdentifier:@"com.nothingmagical.syntaxkit"] pathForResource:name ofType:@"tmTheme"];
//	NSData *data = [[NSData alloc] initWithContentsOfFile:path];
//	if (data) {
//	NSDictionary *dictionary = [NSPropertyListSerialization propertyListWithData:data options:(NSPropertyListReadOptions)kNilOptions format:nil error:nil];
//	theme = [[SYNTheme alloc] initWithDictionary:dictionary];
//	[themeCache setObject:theme forKey:name];
//	}
//	}
//	return theme;
//	}

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

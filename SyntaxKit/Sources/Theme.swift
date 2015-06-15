//
//  Theme.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/5/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

import Foundation

struct Theme {
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

	let UUID: String
	let name: String
	let settings: [String: AnyObject]


	// MARK: - Initializers

	init?(dictionary: [NSObject: AnyObject]) {
		guard let UUID = dictionary["uuid"] as? String,
			name = dictionary["name"] as? String,
			settings = dictionary["settings"] as? [String: AnyObject]
			else { return nil }

		self.UUID = UUID
		self.name = name
		self.settings = settings
	}
}

//
//  Language.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/5/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

import Foundation

public typealias Repository = [String: Pattern]

public struct Language {
//	#pragma mark - Factory
//
//	+ (instancetype)languageWithName:(NSString *)name {
//	if (!name) {
//	return nil;
//	}
//
//	static NSCache *languageCache;
//	static dispatch_once_t onceToken;
//	dispatch_once(&onceToken, ^{
//	languageCache = [[NSCache alloc] init];
//	});
//
//	NSDictionary *mapping = [languageCache objectForKey:@"_mapping"];
//	if (!mapping) {
//	NSString *path = [[NSBundle bundleWithIdentifier:@"com.nothingmagical.syntaxkit"] pathForResource:@"LanguageMap" ofType:@"plist"];
//	NSData *data = [[NSData alloc] initWithContentsOfFile:path];
//	if (data) {
//	mapping = [NSPropertyListSerialization propertyListWithData:data options:(NSPropertyListReadOptions)kNilOptions format:nil error:nil];
//	[languageCache setObject:mapping forKey:@"_mapping"];
//	}
//	}
//
//	NSString *fileName = mapping[name];
//	if (!fileName) {
//	fileName = name;
//	}
//
//	SYNLanguage *language = [languageCache objectForKey:fileName];
//	if (!language) {
//	NSString *path = [[NSBundle bundleWithIdentifier:@"com.nothingmagical.syntaxkit"] pathForResource:fileName ofType:@"tmLanguage"];
//	NSData *data = [[NSData alloc] initWithContentsOfFile:path];
//	if (data) {
//	NSDictionary *dictionary = [NSPropertyListSerialization propertyListWithData:data options:(NSPropertyListReadOptions)kNilOptions format:nil error:nil];
//	language = [[SYNLanguage alloc] initWithDictionary:dictionary];
//	[languageCache setObject:language forKey:fileName];
//	}
//	}
//	return language;
//	}


	// MARK: - Properties

	public let UUID: String
	public let name: String
	public let scopeName: String
	public let patterns: [Pattern]


	// MARK: - Initializers

	public init?(dictionary: [NSObject: AnyObject]) {
		guard let UUID = dictionary["uuid"] as? String,
			name = dictionary["name"] as? String,
			scopeName = dictionary["scopeName"] as? String
			else { return nil }

		self.UUID = UUID
		self.name = name
		self.scopeName = scopeName

		var repository = [String: Pattern]()
		if let repo = dictionary["repository"] as? [String: [NSObject: AnyObject]] {
			for (key, value) in repo {
				if let pattern = Pattern(dictionary: value) {
					repository[key] = pattern
				}
			}
		}

		var patterns = [Pattern]()
		if let array = dictionary["patterns"] as? [[NSObject: AnyObject]] {
			for value in array {
				if let include = value["include"] as? String {
					let key = include.substringFromIndex(include.startIndex.successor())
					if let pattern = repository[key] {
						patterns.append(pattern)
						continue
					}
				}

				if let pattern = Pattern(dictionary: value) {
					patterns.append(pattern)
				}
			}
		}
		self.patterns = patterns
	}
}

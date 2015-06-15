//
//  Language.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/5/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

import Foundation

typealias Repository = [String: Pattern]

struct Language {
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

	let UUID: String
	let name: String
	let scopeName: String
	let repository: Repository
	let patterns: [Pattern]


	// MARK: - Initializers

	init?(dictionary: [NSObject: AnyObject]) {
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
		self.repository = repository

		var patterns = [Pattern]()
		if let array = dictionary["patterns"] as? [[NSObject: AnyObject]] {
			for value in array {
				// TODO: Handle repository
				if let pattern = Pattern(dictionary: value) {
					patterns.append(pattern)
				}
			}
		}
		self.patterns = patterns
	}
}

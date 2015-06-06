//
//  Language.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/5/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

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
//
//
//	#pragma mark - Initializers
//
//	- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
//	if ((self = [super init])) {
//	self.UUID = dictionary[@"uuid"];
//	self.name = dictionary[@"name"];
//	self.scopeName = dictionary[@"scopeName"];
//
//	// Repository
//	NSDictionary *repo = dictionary[@"repository"];
//	NSMutableDictionary *repository = [[NSMutableDictionary alloc] init];
//	for (NSString *key in repo) {
//	repository[key] = [[SYNPattern alloc] initWithDictionary:repo[key]];
//	}
//
//	if ([repository count] > 0) {
//	self.repository = repository;
//	}
//
//	// Patterns
//	NSMutableArray *patterns = [[NSMutableArray alloc] init];
//	for (NSDictionary *dict in dictionary[@"patterns"]) {
//	SYNPattern *pattern = [SYNPattern patternWithDictionary:dict language:self];
//	if (pattern) {
//	[patterns addObject:pattern];
//	}
//	}
//
//	if ([patterns count] > 0) {
//	self.patterns = patterns;
//	}
//	}
//	return self;
//	}
}

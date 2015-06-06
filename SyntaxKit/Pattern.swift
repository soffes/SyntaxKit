//
//  Pattern.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/5/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

struct Pattern {
//	+ (instancetype)patternWithDictionary:(NSDictionary *)dictionary language:(SYNLanguage *)language {
//	NSString *include = dictionary[@"include"];
//	if (include) {
//	include = [include substringFromIndex:1];
//	return language.repository[include];
//	}
//
//	return [[self alloc] initWithDictionary:dictionary];
//	}
//
//
//	- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
//	if ((self = [super init])) {
//	self.name = dictionary[@"name"];
//
//	self.match = dictionary[@"match"];
//	self.captures = [[SYNCaptureCollection alloc] initWithDictionary:dictionary[@"captures"]];
//
//	self.begin = dictionary[@"begin"];
//	self.beginCaptures = [[SYNCaptureCollection alloc] initWithDictionary:dictionary[@"beginCaptures"]];
//
//	self.end = dictionary[@"end"];
//	self.endCaptures = [[SYNCaptureCollection alloc] initWithDictionary:dictionary[@"endCaptures"]];
//
//	NSMutableArray *patterns = [[NSMutableArray alloc] init];
//	for (NSDictionary *dict in dictionary[@"patterns"]) {
//	SYNPattern *pattern = [[[self class] alloc] initWithDictionary:dict];
//	pattern.parent = self;
//	[patterns addObject:pattern];
//	}
//
//	if ([patterns count] > 0) {
//	self.patterns = patterns;
//	}
//	}
//	return self;
//	}
//
//
//	- (SYNPattern *)superpattern {
//	return self.parent;
//	}
//
//	- (NSArray *)subpatterns {
//	return self.patterns;
//	}
}

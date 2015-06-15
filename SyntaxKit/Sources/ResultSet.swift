//
//  ResultSet.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/14/15.
//  Copyright © 2015 Sam Soffes. All rights reserved.
//

import Foundation

public struct ResultSet {
//	@synthesize results = _results;
//	@synthesize range = _range;
//
//
//	- (instancetype)init {
//		if ((self = [super init])) {
//			self.range = NSMakeRange(NSNotFound, 0);
//		}
//		return self;
//	}
//
//
//	- (void)addResult:(SYNResult *)result {
//	if (!result) {
//	return;
//	}
//
//	if (!_results) {
//	_results = [[NSMutableArray alloc] init];
//	}
//
//	[(NSMutableArray *)_results addObject:result];
//
//	NSInteger location = self.range.location;
//	if (location == NSNotFound) {
//	self.range = result.range;
//	return;
//	}
//
//	// Assume these are added in the correct order for performance
//	self.range = NSMakeRange(location, NSMaxRange(result.range) - location);
//	}
//
//
//	- (void)addResultsFromResultSet:(SYNResultSet *)resultSet {
//	NSRange range = self.range;
//	for (SYNResult *result in resultSet.results) {
//	[self addResult:result];
//	}
//	self.range = NSUnionRange(range, resultSet.range);
//	}
//
//
//	- (void)addResultWithScope:(NSString *)scope range:(NSRange)range {
//	SYNResult *result = [[SYNResult alloc] init];
//	result.scope = scope;
//	result.range = range;
//	[self addResult:result];
//	}
//
//
//	- (BOOL)isEmpty {
//	return [self.results count] == 0;
//	}
}
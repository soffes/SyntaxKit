//
//  Parser.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 6/5/15.
//  Copyright (c) 2015 Sam Soffes. All rights reserved.
//

public class Parser {
//	- (instancetype)initWithLanguageName:(NSString *)languageName {
//	if ((self = [super init])) {
//	self.language = [SYNLanguage languageWithName:languageName];
//
//	if (!self.language) {
//	return (self = nil);
//	}
//	}
//	return self;
//	}
//
//
//	- (void)parse:(NSString *)string match:(SYNParserMatchCallback)callback {
//	NSParameterAssert(string);
//	NSParameterAssert(callback);
//
//	// Loop through paragraphs
//	NSUInteger length = [string length];
//	NSUInteger paragraphStart = 0;
//	NSUInteger paragraphEnd = 0;
//	NSUInteger contentsEnd = 0;
//	while (paragraphEnd < length) {
//	[string getParagraphStart:&paragraphStart end:&paragraphEnd
//	contentsEnd:&contentsEnd forRange:NSMakeRange(paragraphEnd, 0)];
//	NSRange paragraphRange = NSMakeRange(paragraphStart, contentsEnd - paragraphStart);
//	NSUInteger limit = NSMaxRange(paragraphRange);
//	NSRange range = paragraphRange;
//
//	// Loop through the line until we reach the end
//	while (range.length > 0 && range.location < limit) {
//	NSUInteger location = [self parse:string inRange:range callback:callback];
//	range.location = location;
//	range.length = fmax(0, range.length - paragraphRange.location - range.location);
//	}
//	}
//	}
//
//
//	#pragma mark - Private
//
//	// Returns new location
//	- (NSUInteger)parse:(NSString *)string inRange:(NSRange)bounds callback:(SYNParserMatchCallback)callback {
//	for (SYNPattern *pattern in self.language.patterns) {
//	// Single pattern
//	if (pattern.match) {
//	SYNResultSet *resultSet = [self parse:string inRange:bounds scope:pattern.name expression:pattern.match captures:pattern.captures];
//	if (!resultSet) {
//	continue;
//	}
//	return [self applyResults:resultSet callback:callback];
//	}
//
//	// Begin & end
//	if (pattern.begin && pattern.end) {
//	SYNResultSet *begin = [self parse:string inRange:bounds scope:nil expression:pattern.begin captures:pattern.beginCaptures];
//	if (!begin) {
//	continue;
//	}
//
//	NSRange endRange = bounds;
//	endRange.location = NSMaxRange(begin.range);
//	endRange.length -= endRange.location - bounds.location;
//
//	SYNResultSet *end = [self parse:string inRange:endRange scope:nil expression:pattern.end captures:pattern.endCaptures];
//	if (!end) {
//	// TODO: Rewind?
//	continue;
//	}
//
//	SYNResultSet *resultSet = [[SYNResultSet alloc] init];
//
//	// Add whole scope before start and end
//	if (pattern.name) {
//	[resultSet addResultWithScope:pattern.name range:NSUnionRange(begin.range, end.range)];
//	}
//
//	[resultSet addResultsFromResultSet:begin];
//	[resultSet addResultsFromResultSet:end];
//
//	return [self applyResults:resultSet callback:callback];
//	}
//	}
//
//	return NSMaxRange(bounds);
//	}
//
//
//	// Parse an expression with captures
//	- (SYNResultSet *)parse:(NSString *)string inRange:(NSRange)bounds scope:(NSString *)scope expression:(NSString *)pattern captures:(SYNCaptureCollection *)captures {
//	NSRegularExpression *expression = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionAnchorsMatchLines error:nil];
//	NSArray *matches = [expression matchesInString:string options:kNilOptions range:bounds];
//	NSTextCheckingResult *result = [matches firstObject];
//	if (!result) {
//	return nil;
//	}
//
//	SYNResultSet *resultSet = [[SYNResultSet alloc] init];
//	if (scope && result.range.location != NSNotFound) {
//	[resultSet addResultWithScope:scope range:result.range];
//	}
//
//	for (NSNumber *index in [captures captureIndexes]) {
//	NSRange range = [result rangeAtIndex:[index integerValue]];
//	if (range.location == NSNotFound) {
//	continue;
//	}
//
//	scope = [[captures captureAtIndex:[index integerValue]] name];
//	[resultSet addResultWithScope:scope range:range];
//	}
//
//	if (![resultSet isEmpty]) {
//	return resultSet;
//	}
//
//	return nil;
//	}
//
//
//	- (NSUInteger)applyResults:(SYNResultSet *)resultSet callback:(SYNParserMatchCallback)callback {
//	NSUInteger max = 0;
//	for (SYNResult *result in resultSet.results) {
//	callback(result.scope, result.range);
//	max = fmax(NSMaxRange(result.range), max);
//	}
//	return max;
//	}
//
//	@end
}

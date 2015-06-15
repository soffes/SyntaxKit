//
//  AttributedParser.swift
//  SyntaxKit
//
//  Created by Sam Soffes on 9/24/14.
//  Copyright © 2014-2015 Sam Soffes. All rights reserved.
//

public class AttributedParser: Parser {
//	#pragma mark - Accessors
//
//	@synthesize baseAttributes = _baseAttributes;
//	@synthesize attributes = _attributes;
//	@synthesize fontFamily = _fontFamily;
//
//	- (void)setTheme:(SYNTheme *)theme {
//	_theme = theme;
//	[self updateTheme];
//	}
//
//
//	- (void)setFontFamily:(NOMFontFamily *)fontFamily {
//	_fontFamily = fontFamily;
//	[self updateTheme];
//	}
//
//
//	#pragma mark - Initializers
//
//	- (instancetype)initWithLanguageName:(NSString *)languageName themeName:(NSString *)themeName {
//	if ((self = [super initWithLanguageName:languageName])) {
//	self.attributes = [[NSMutableDictionary alloc] init];
//	self.theme = [SYNTheme themeWithName:themeName];
//	}
//	return self;
//	}
//
//
//	- (instancetype)initWithLanguageName:(NSString *)languageName {
//	return (self = [self initWithLanguageName:languageName themeName:nil]);
//	}
//
//
//	- (void)setAttributes:(NSDictionary *)attributes forScope:(NSString *)scope {
//	self.attributes[scope] = attributes;
//	}
//
//
//	#pragma mark - Parsing
//
//	- (void)parse:(NSString *)string attributedMatch:(SYNAttributedParserMatchCallback)match {
//	[self parse:string match:^(NSString *scope, NSRange range) {
//	NSDictionary *attributes = [self attributesForScope:scope];
//	if (attributes) {
//	match(scope, range, attributes);
//	}
//	}];
//	}
//
//
//	#pragma mark - Attributes
//
//	- (NSDictionary *)attributesForScope:(NSString *)scope {
//	if (!scope) {
//	return nil;
//	}
//
//	NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
//	NSArray *components = [scope componentsSeparatedByString:@"."];
//
//	NSUInteger count = [components count];
//	if (count == 0) {
//	return nil;
//	}
//
//	for (NSUInteger i = 0; i < count; i++) {
//	NSString *key = [[components subarrayWithRange:NSMakeRange(0, count - 1 - i)] componentsJoinedByString:@"."];
//	[attributes addEntriesFromDictionary:self.attributes[key]];
//	}
//
//	if ([attributes count] == 0) {
//	return nil;
//	}
//
//	return attributes;
//	}
//
//
//	- (void)removeAttributesForScope:(NSString *)scope {
//	[self.attributes removeObjectForKey:scope];
//	}
//
//
//	- (NSAttributedString *)attributedStringForString:(NSString *)string {
//	NSMutableAttributedString *output = [[NSMutableAttributedString alloc] initWithString:string attributes:self.baseAttributes];
//
//	[self parse:string match:^(NSString *scope, NSRange range) {
//	NSDictionary *attributes = [self attributesForScope:scope];
//	if (attributes) {
//	[output addAttributes:attributes range:range];
//	}
//	}];
//
//	return output;
//	}
//
//
//	#pragma mark - Private
//
//	- (void)updateTheme {
//	for (NSDictionary *item in self.theme.settings) {
//	NSString *scopes = item[@"scope"];
//	NSDictionary *settings = item[@"settings"];
//	NSDictionary *attributes = [self attributesFromSettings:settings];
//	if (!scopes) {
//	[self setBaseAttributes:attributes];
//	continue;
//	}
//
//	NSArray *components = [scopes componentsSeparatedByString:@","];
//	for (NSString *component in components) {
//	NSString *scope = [component stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//	[self setAttributes:attributes forScope:scope];
//	}
//	}
//	}
//
//	- (NSDictionary *)attributesFromSettings:(NSDictionary *)settings {
//	static NSDictionary *map;
//	static dispatch_once_t onceToken;
//	dispatch_once(&onceToken, ^{
//	map = @{
//	@"foreground": NSForegroundColorAttributeName,
//	@"background": NSBackgroundColorAttributeName
//	// TODO: caret, invisibles, lightHighlight, selection
//	};
//	});
//
//	NSMutableDictionary *attributes = [[NSMutableDictionary alloc] initWithCapacity:[settings count]];
//	for (NSString *key in settings) {
//	NSString *name = map[key];
//	if (name) {
//	attributes[name] = [NOMColor colorWithHex:settings[key]];
//	continue;
//	}
//
//	if (self.fontFamily && [key isEqualToString:@"fontStyle"]) {
//	NSString *value = settings[key];
//	if ([value isEqualToString:@"italic"]) {
//	NOMFont *font = [self.fontFamily fontForStyle:NOMFontStyleItalic];
//	if (font) {
//	attributes[NSFontAttributeName] = font;
//	}
//	}
//	}
//	}
//	return attributes;
//	}
}

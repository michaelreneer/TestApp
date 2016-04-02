//
//  TSTActionCell_mac.m
//  TestApp
//
//  Created by Michael Reneer on 2/6/14.
//  Copyright © 2016 Michael Reneer. All rights reserved.
//

#import "TSTActionCell_mac.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TSTActionCell {
	CGRect _frame;
}

#pragma mark - Lifecycle

static void TSTActionCellInit(TSTActionCell *self) {
	[self setAccessibilityRole:NSAccessibilityButtonRole];
}

- (instancetype)initImageCell:(nullable NSImage *)image {
	self = [super initImageCell:image];

	if (self != nil) {
		TSTActionCellInit(self);
	}

	return self;
}

- (instancetype)initTextCell:(NSString *)aString {
	self = [super initTextCell:aString];

	if (self != nil) {
		TSTActionCellInit(self);
	}

	return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];

	if (self != nil) {
		TSTActionCellInit(self);
	}

	return self;
}

#pragma mark - Display

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
	[super drawWithFrame:cellFrame inView:controlView];

	[[NSColor redColor] setFill];
	NSRectFill(cellFrame);
}

#pragma mark - Layout

@synthesize frame = _frame;

@end

NS_ASSUME_NONNULL_END

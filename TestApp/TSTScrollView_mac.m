//
//  TSTScrollView_mac.m
//  TestApp
//
//  Created by Michael Reneer on 6/16/14.
//  Copyright © 2016 Michael Reneer. All rights reserved.
//

#import "TSTScrollView_mac.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TSTScrollView

#pragma mark - Lifecycle

static void TSTScrollViewInit(TSTScrollView *self) {
	[self setWantsLayer:YES];

	[self setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawOnSetNeedsDisplay];
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];

	if (self != nil) {
		TSTScrollViewInit(self);
	}

	return self;
}

- (instancetype)initWithFrame:(NSRect)frameRect {
	self = [super initWithFrame:frameRect];

	if (self != nil) {
		TSTScrollViewInit(self);
	}

	return self;
}

#pragma mark - Display

- (void)updateLayer {
	CALayer *layer = [self layer];
	[layer setBorderColor:[[NSColor blackColor] CGColor]];
	[layer setBorderWidth:1.0];
}

- (BOOL)wantsUpdateLayer {
	return YES;
}

#pragma mark - Layout

- (BOOL)isFlipped {
	return YES;
}

@end

NS_ASSUME_NONNULL_END

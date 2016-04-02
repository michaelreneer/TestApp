//
//  TSTView_mac.m
//  TestApp
//
//  Created by Michael Reneer on 3/10/15.
//  Copyright © 2016 Michael Reneer. All rights reserved.
//

#import "TSTView_mac.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TSTView {
	NSColor *_backgroundColor;
}

#pragma mark - Lifecycle

static void TSTViewInit(TSTView *self) {
	[self setWantsLayer:YES];

	[self setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawOnSetNeedsDisplay];
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];

	if (self != nil) {
		TSTViewInit(self);
	}

	return self;
}

- (instancetype)initWithFrame:(NSRect)frameRect {
	self = [super initWithFrame:frameRect];

	if (self != nil) {
		TSTViewInit(self);
	}

	return self;
}

#pragma mark - Display

@synthesize backgroundColor = _backgroundColor;

- (BOOL)isOpaque {
	return YES;
}

- (void)updateLayer {
	CALayer *layer = [self layer];
	[layer setBackgroundColor:[[self backgroundColor] CGColor]];
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

#pragma mark - NSLayerDelegateContentsScaleUpdating

- (BOOL)layer:(CALayer *)layer shouldInheritContentsScale:(CGFloat)newScale fromWindow:(NSWindow *)window {
	return YES;
}

@end

NS_ASSUME_NONNULL_END

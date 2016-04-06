//
//  TSTStackView_mac.m
//  TestApp
//
//  Created by Michael Reneer on 7/14/14.
//  Copyright © 2016 Michael Reneer. All rights reserved.
//

#import "TSTStackView_mac.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TSTStackView {
	NSButton *_button1;
	NSButton *_button2;
	NSButton *_button3;
	NSButton *_button4;
}

#pragma mark - Lifecycle 

static void TSTStackViewInit(TSTStackView *self) {
	[self setWantsLayer:YES];

	NSButton *button1 = [self button1];
	[self addView:button1 inGravity:NSStackViewGravityLeading];
	[self setVisibilityPriority:NSStackViewVisibilityPriorityDetachOnlyIfNecessary - 1 forView:button1];

	NSButton *button2 = [self button2];
	[self addView:button2 inGravity:NSStackViewGravityLeading];
	[self setVisibilityPriority:NSStackViewVisibilityPriorityDetachOnlyIfNecessary - 2 forView:button2];

	NSButton *button3 = [self button3];
	[self addView:button3 inGravity:NSStackViewGravityTrailing];
	[self setVisibilityPriority:NSStackViewVisibilityPriorityDetachOnlyIfNecessary - 3 forView:button3];

	NSButton *button4 = [self button4];
	[self addView:button4 inGravity:NSStackViewGravityTrailing];
	[self setVisibilityPriority:NSStackViewVisibilityPriorityDetachOnlyIfNecessary - 4 forView:button4];
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];

	if (self != nil) {
		TSTStackViewInit(self);
	}

	return self;
}

- (instancetype)initWithFrame:(NSRect)frameRect {
	self = [super initWithFrame:frameRect];

	if (self != nil) {
		TSTStackViewInit(self);
	}

	return self;
}

#pragma mark - View

- (NSButton *)button1 {
	if (_button1 == nil) {
		_button1 = [[NSButton alloc] initWithFrame:NSZeroRect];
		[_button1 addConstraint:[NSLayoutConstraint constraintWithItem:_button1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:30]];
		[_button1 addConstraint:[NSLayoutConstraint constraintWithItem:_button1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100]];
		[_button1 setTitle:@"11111"];
		[_button1 setTranslatesAutoresizingMaskIntoConstraints:NO];
	}

	return _button1;
}

- (NSButton *)button2 {
	if (_button2 == nil) {
		_button2 = [[NSButton alloc] initWithFrame:NSZeroRect];
		[_button2 addConstraint:[NSLayoutConstraint constraintWithItem:_button2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:30]];
		[_button2 addConstraint:[NSLayoutConstraint constraintWithItem:_button2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100]];
		[_button2 setTitle:@"22222"];
		[_button2 setTranslatesAutoresizingMaskIntoConstraints:NO];
	}

	return _button2;
}

- (NSButton *)button3 {
	if (_button3 == nil) {
		_button3 = [[NSButton alloc] initWithFrame:NSZeroRect];
		[_button3 addConstraint:[NSLayoutConstraint constraintWithItem:_button3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:30]];
		[_button3 addConstraint:[NSLayoutConstraint constraintWithItem:_button3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100]];
		[_button3 setTitle:@"33333"];
		[_button3 setTranslatesAutoresizingMaskIntoConstraints:NO];
	}

	return _button3;
}

- (NSButton *)button4 {
	if (_button4 == nil) {
		_button4 = [[NSButton alloc] initWithFrame:NSZeroRect];
		[_button4 addConstraint:[NSLayoutConstraint constraintWithItem:_button4 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:30]];
		[_button4 addConstraint:[NSLayoutConstraint constraintWithItem:_button4 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:100]];
		[_button4 setTitle:@"44444"];
		[_button4 setTranslatesAutoresizingMaskIntoConstraints:NO];
	}

	return _button4;
}

@end

NS_ASSUME_NONNULL_END

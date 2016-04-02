//
//  TSTScrollView_ios.m
//  TestApp
//
//  Created by Michael Reneer on 7/30/14.
//  Copyright © 2016 Michael Reneer. All rights reserved.
//

#import "TSTScrollView_ios.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TSTScrollView {
	__weak UIView *_containerView;
}

#pragma mark - Lifecycle

static void TSTScrollViewInit(TSTScrollView *self) {
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];

	if (self != nil) {
		TSTScrollViewInit(self);
	}

	return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];

	if (self != nil) {
		TSTScrollViewInit(self);
	}

	return self;
}

#pragma mark - Layout

- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
	BOOL isPointInside;
	UIView *containerView = [self containerView];

	if (containerView != nil) {
		CGPoint containerPoint = [containerView convertPoint:point fromView:self];
		isPointInside = [containerView pointInside:containerPoint withEvent:event];
	} else {
		isPointInside = [super pointInside:point withEvent:event];
	}

	return isPointInside;
}

#pragma mark - View

@synthesize containerView = _containerView;

@end

NS_ASSUME_NONNULL_END

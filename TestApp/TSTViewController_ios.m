//
//  TSTViewController_ios.m
//  TestApp
//
//  Created by Michael Reneer on 3/10/15.
//  Copyright © 2016 Michael Reneer. All rights reserved.
//

#import "TSTViewController_ios.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TSTViewController

#pragma mark - Lifecycle

static void TSTViewControllerInit(TSTViewController *self) {
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];

	if (self != nil) {
		TSTViewControllerInit(self);
	}

	return self;
}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

	if (self != nil) {
		TSTViewControllerInit(self);
	}

	return self;
}

@end

NS_ASSUME_NONNULL_END

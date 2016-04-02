//
//  TSTTableViewController_ios.m
//  ExampleTableViewController
//
//  Created by Michael Reneer on 11/26/13.
//  Copyright © 2016 Michael Reneer. All rights reserved.
//

#import "TSTTableViewController_ios.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TSTTableViewController

#pragma mark - Lifecycle 

static void TSTTableViewControllerInit(TSTTableViewController *self) {
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];

	if (self != nil) {
		TSTTableViewControllerInit(self);
	}

	return self;
}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil  {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

	if (self != nil) {
		TSTTableViewControllerInit(self);
	}

	return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
	self = [super initWithStyle:style];

	if (self != nil) {
		TSTTableViewControllerInit(self);
	}

	return self;
}

@end

NS_ASSUME_NONNULL_END

//
//  TSTScenarioController_mac.m
//  TestApp
//
//  Created by Michael Reneer on 3/10/15.
//  Copyright © 2016 Michael Reneer. All rights reserved.
//

#import "TSTScenarioController_mac.h"
#import "TSTLayer.h"
#import "TSTScrollView_mac.h"
#import "TSTView_mac.h"
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@implementation TSTScenarioController

#pragma mark - Lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];

	// view
	NSView *view = [self view];

	// document view
	TSTView *documentView = [[TSTView alloc] initWithFrame:CGRectMake(0.0, 0.0, 1000.0, 1000.0)];

	// scroll view
	TSTScrollView *scrollView = [[TSTScrollView alloc] initWithFrame:CGRectZero];
	[scrollView setAllowsMagnification:YES];
	[scrollView setDocumentView:documentView];
	[scrollView setHasHorizontalRuler:YES];
	[scrollView setHasVerticalRuler:YES];

	[view addSubview:scrollView];

	[scrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
	NSDictionary *views = NSDictionaryOfVariableBindings(scrollView);
	[view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics:nil views:views]];
	[view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics:nil views:views]];

	// view1
	NSColor *color = [NSColor orangeColor];
	TSTView *view1 = [[TSTView alloc] initWithFrame:CGRectMake(10.0, 10.0, 200.0, 200.0)];
	[view1 setBackgroundColor:color];

	[documentView addSubview:view1];
}

@end

NS_ASSUME_NONNULL_END

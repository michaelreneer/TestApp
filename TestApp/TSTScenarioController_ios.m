//
//  TSTScenarioController_ios.h
//  TestApp
//
//  Created by Michael Reneer on 3/10/15.
//  Copyright © 2016 Michael Reneer. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "TSTLayer.h"
#import "TSTScenarioController_ios.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TSTScenarioController

#pragma mark - Lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];

	// view
	UIView *view = (UIView *)[self view];

	// layer
	CALayer *layer = [view layer];

	// layer 1
	TSTLayer *layer1 = [[TSTLayer alloc] init];
	[layer1 setFrame:CGRectMake(50, 50, 200, 200)];
	[layer1 setNeedsDisplay];

	[layer addSublayer:layer1];

	// layer 2
	TSTLayer *layer2 = [[TSTLayer alloc] init];
	[layer2 setFrame:CGRectMake(100, 100, 200, 200)];
	[layer2 setNeedsDisplay];

	[layer1 addSublayer:layer2];

	[self shrinkLayer:layer1];
}

#pragma mark - 

- (void)shrinkLayer:(CALayer *)layer {
	CGRect frame = [layer frame];

	if (frame.size.height > 100 && frame.size.width > 100) {
		frame.size.height -= 10;
		frame.size.width -= 10;
		[layer setFrame:frame];

		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			[self shrinkLayer:layer];
		});
	}
}

@end

NS_ASSUME_NONNULL_END

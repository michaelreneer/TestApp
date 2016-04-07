//
//  TSTTestAppUITests.m
//  TestAppUITests
//
//  Created by Michael Reneer on 3/31/16.
//  Copyright © 2016 Michael Reneer. All rights reserved.
//

#import <XCTest/XCTest.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSTTestAppUITests : XCTestCase
@end

@implementation TSTTestAppUITests

- (void)setUp {
	[super setUp];

	[self setContinueAfterFailure:NO];

	[[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
	[super tearDown];
}

- (void)testExample {
}

- (void)testPerformanceExample {
}

@end

NS_ASSUME_NONNULL_END

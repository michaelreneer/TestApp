//
//  TSTTableViewCell_ios.m
//  TestApp
//
//  Created by Michael Reneer on 11/26/13.
//  Copyright © 2016 Michael Reneer. All rights reserved.
//

#import "TSTTableViewCell_ios.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TSTTableViewCell

static void TSTTableViewCellInit(TSTTableViewCell *self) {
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

	if (self != nil) {
		TSTTableViewCellInit(self);
	}

	return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];

	if (self != nil) {
		TSTTableViewCellInit(self);
	}

	return self;
}

@end

NS_ASSUME_NONNULL_END

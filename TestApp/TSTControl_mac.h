//
//  TSTControl_mac.h
//  TestApp
//
//  Created by Michael Reneer on 2/6/14.
//  Copyright © 2016 Michael Reneer. All rights reserved.
//

#import <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TSTActionCell;

@interface TSTControl : NSControl

@property (nonatomic, readonly) NSArray<TSTActionCell *> *cells;

@end

NS_ASSUME_NONNULL_END

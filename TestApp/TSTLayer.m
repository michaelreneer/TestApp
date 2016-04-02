//
//  TSTLayer.m
//  TestApp
//
//  Created by Michael Reneer on 3/10/15.
//  Copyright © 2016 Michael Reneer. All rights reserved.
//

#import "TSTLayer.h"

#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@implementation TSTLayer {
	CGRect _dirtyRect;

	CGContextRef _context;
}

#pragma mark - Lifecycle

static void TSTLayerInit(TSTLayer *self) {
	const CGFloat components[] = {0.2, 0.2, 0.2, 1.0};
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef color = CGColorCreate(colorSpace, components);
	CGColorSpaceRelease(colorSpace);

	[self setBorderColor:color];
	CGColorRelease(color);

	[self setBorderWidth:2.0];
}

- (void)dealloc {
	CGContextRelease(_context);
}

- (instancetype)init {
	self = [super init];

	if (self != nil) {
		TSTLayerInit(self);
	}

	return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];

	if (self != nil) {
		TSTLayerInit(self);
	}

	return self;
}

- (instancetype)initWithLayer:(id)layer {
	self = [super initWithLayer:layer];

	if (self != nil) {
		TSTLayerInit(self);
	}

	return self;
}

#pragma mark - Display

- (void)display {
	id delegate = [self delegate];

	if ([delegate respondsToSelector:@selector(displayLayer:)]) {
		[delegate displayLayer:self];
	} else {
		CGRect bounds = [self bounds];
		CGRect dirtyRect = _dirtyRect;

		if (CGRectEqualToRect(dirtyRect, CGRectZero)) {
			dirtyRect = bounds;
		}

		dirtyRect = CGRectIntersection(dirtyRect, bounds);

		if (_context == NULL) {
			CGBitmapInfo bitmapInfo = (CGBitmapInfo)kCGImageAlphaPremultipliedFirst;
			size_t bitsPerComponent = 8;
			size_t bytesPerRow = (size_t)bounds.size.width * 4;
			CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
			_context = CGBitmapContextCreate(NULL, (size_t)bounds.size.width, (size_t)bounds.size.height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
			CGColorSpaceRelease(colorSpace);

			CGContextTranslateCTM(_context, 0, bounds.size.height);
			CGContextScaleCTM(_context, 1.0, -1.0);
		}

		CGBitmapInfo bitmapInfo = (CGBitmapInfo)kCGImageAlphaPremultipliedFirst;
		size_t bitsPerComponent = 8;
		size_t bytesPerRow = (size_t)bounds.size.width * 4;
		CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
		CGContextRef context = CGBitmapContextCreate(NULL, (size_t)bounds.size.width, (size_t)bounds.size.height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGColorSpaceRelease(colorSpace);

		CGContextTranslateCTM(context, 0, bounds.size.height);
		CGContextScaleCTM(context, 1.0, -1.0);

		CGContextClipToRect(context, dirtyRect);

		[self drawInContext:context];

		CGImageRef partialImage = CGBitmapContextCreateImage(context);
		CGContextRelease(context);

		CGContextClearRect(_context, dirtyRect);
		CGContextDrawImage(_context, bounds, partialImage);

		CGImageRelease(partialImage);

		CGImageRef image = CGBitmapContextCreateImage(_context);
		[self setContents:(__bridge id)image];
		CGImageRelease(image);

		_dirtyRect = CGRectZero;
	}
}

- (void)drawInContext:(CGContextRef)context {
	id delegate = [self delegate];

	if ([delegate respondsToSelector:@selector(drawLayer:inContext:)]) {
		[delegate drawLayer:self inContext:context];
	} else {
		CGContextSaveGState(context);

		CGRect bounds = CGContextGetClipBoundingBox(context);

		CGContextSetLineWidth(context, 2.0);
		CGContextSetRGBStrokeColor(context, 0.2, 0.2, 0.2, 1.0);

		NSUInteger limit = (NSUInteger)fmax(bounds.size.width, bounds.size.height) / 2;

		for (NSUInteger index = 0; index < limit; index += 8) {
			NSUInteger count = (index / 8);
			CGContextSetRGBFillColor(context, 1.0 - (count % 4) / 4.0, 1.0 - (count % 8) / 8.0, (count % 16) / 16.0, 1.0);

			CGRect rect = CGRectMake(index, index, bounds.size.width - index * 2, bounds.size.height - index * 2);
			CGContextFillRect(context, rect);
		}

		for (NSUInteger index = 0; index < limit; index += 4) {
			CGRect rect = CGRectMake(index, index, bounds.size.width - index * 2, bounds.size.height - index * 2);
			CGContextStrokeRect(context, rect);
		}

		CGContextRestoreGState(context);
	}
}

- (void)setNeedsDisplayInRect:(CGRect)rect {
	[super setNeedsDisplayInRect:rect];

	if (!CGRectEqualToRect(_dirtyRect, CGRectZero)) {
		rect = CGRectUnion(_dirtyRect, rect);
	}

	_dirtyRect = rect;
}

@end

NS_ASSUME_NONNULL_END

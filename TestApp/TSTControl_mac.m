//
//  TSTControl_mac.m
//  TestApp
//
//  Created by Michael Reneer on 2/6/14.
//  Copyright © 2016 Michael Reneer. All rights reserved.
//

#import "TSTActionCell_mac.h"
#import "TSTControl_mac.h"

NS_ASSUME_NONNULL_BEGIN

@implementation TSTControl {
	NSArray<TSTActionCell *> *_cells;
}

#pragma mark - Lifecycle

static void TSTControlInit(TSTControl *self) {
	[self setWantsLayer:YES];
}

- (instancetype)initWithFrame:(NSRect)frameRect {
	self = [super initWithFrame:frameRect];

	if (self != nil) {
		TSTControlInit(self);
	}

	return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];

	if (self != nil) {
		TSTControlInit(self);
	}

	return self;
}

#pragma mark - Display 

- (void)drawRect:(NSRect)dirtyRect {
	[super drawRect:dirtyRect];

	[[NSColor orangeColor] setFill];
	NSRectFill(dirtyRect);

	for (TSTActionCell *cell in [self cells]) {
		[cell drawWithFrame:[cell frame] inView:self];
	}
}

#pragma mark - Cell

- (NSArray<TSTActionCell *> *)cells {
	if (_cells == nil) {
		TSTActionCell *cell1 = [[TSTActionCell alloc] init];
		[cell1 setFrame:NSMakeRect(10.0, 10.0, 30.0, 30.0)];
		TSTActionCell *cell2 = [[TSTActionCell alloc] init];
		[cell2 setFrame:NSMakeRect(50.0, 10.0, 30.0, 30.0)];
		TSTActionCell *cell3 = [[TSTActionCell alloc] init];
		[cell3 setFrame:NSMakeRect(100.0, 10.0, 30.0, 30.0)];
		TSTActionCell *cell4 = [[TSTActionCell alloc] init];
		[cell4 setFrame:NSMakeRect(150.0, 10.0, 30.0, 30.0)];

		_cells = @[
			cell1,
			cell2,
			cell3,
			cell4,
		];
	}

	return _cells;
}

#pragma mark - NSAccessibility

- (nullable id)accessibilityHitTest:(NSPoint)point {
	NSRect rect = NSMakeRect(point.x, point.y, 0, 0);
	NSRect windowRect = [[self window] convertRectFromScreen:rect];
	NSRect localRect = [self convertRect:windowRect fromView:nil];
	TSTActionCell *hitCell = nil;

	for (TSTActionCell *cell in [self cells]) {
		if (NSPointInRect(localRect.origin, [cell frame])) {
			hitCell = cell;

			break;
		}
	}

	id element = [hitCell accessibilityHitTest:point];

	if (element == nil) {
		element = [super accessibilityHitTest:point];
	}

	return element;
}

- (nullable id)accessibilityFocusedUIElement {
	TSTActionCell *focusedCell = nil;

	for (TSTActionCell *cell in [self cells]) {
		if ([[[self window] firstResponder] isEqual:cell]) {
			focusedCell = cell;

			break;
		}
	}

	id element = [focusedCell accessibilityFocusedUIElement];

	if (element == nil) {
		element = [super accessibilityFocusedUIElement];
	}

	return element;
}

@end

NS_ASSUME_NONNULL_END

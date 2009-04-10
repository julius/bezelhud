//
//  SFRankCell.m
//  SilverFlow
//
//  Created by Julius Eckert on 26.01.08.
//  Copyright 2008 Julius Eckert. All rights reserved.
//

#import "SFRankCell.h"


@implementation SFRankCell


- (id)initImageCell:(NSImage *)anImage {
	if (self = [super initImageCell:anImage]) {
		
	}
	return self;
}


- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {

	NSBezierPath *roundRect = [NSBezierPath bezierPath];
	[roundRect appendBezierPathWithRoundedRectangle:cellFrame withRadius:NSHeight(cellFrame) /2];
	
	float size = MIN(NSHeight(cellFrame), NSWidth(cellFrame) );
	NSRect drawRect = centerRectInRect(NSMakeRect(0, 0, size*1/3, size*1/3), cellFrame);
	NSBezierPath *path = [NSBezierPath bezierPathWithOvalInRect:drawRect];
	
	[[NSColor whiteColor] set];
	
	[[NSBezierPath bezierPathWithOvalInRect:NSInsetRect(drawRect, -1, -1)] fill];
	
	if (order != 0) {
		[[NSColor grayColor] set];
		
		[path fill];
	}
}


@end

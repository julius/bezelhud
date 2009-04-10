//
//  SFTextField.m
//  SilverFlow
//
//  Created by Julius Eckert on 26.01.08.
//  Copyright 2008 Julius Eckert. All rights reserved.
//

#import "SFTextField.h"


@implementation SFTextField

- (void)setTextColor:(NSColor *)aColor {
	if (aColor == [NSColor blueColor]) aColor = [NSColor whiteColor];
	if (aColor == [NSColor blackColor]) aColor = [NSColor colorWithCalibratedRed:1 green:1 blue:1 alpha:0.7];
	if (aColor == [NSColor redColor]) aColor = [NSColor colorWithCalibratedRed:.2 green:.2 blue:.2 alpha:0.8];
	
	[super setTextColor:aColor];
}

@end

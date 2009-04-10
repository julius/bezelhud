//
//  BHResultWindow.m
//  BezelHUD
//
//  Created by Julius Eckert on 05.05.08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "BHResultWindow.h"
#import "BlurSetting.h"

@implementation BHResultWindow

- (id)initWithContentRect:(NSRect)contentRect styleMask:(unsigned int)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag {
	NSWindow* result = [super initWithContentRect:contentRect styleMask:aStyle backing:bufferingType defer:flag];
	blurFilterR = -1;
	return result;
}
-(void) applyBlurEffect {
	if (!SUPPORT_BLURRING) return;
	if (blurFilterR != -1) return;
	
	CGSNewCIFilterByName(_CGSDefaultConnection(), (CFStringRef)@"CIGaussianBlur", &blurFilterR);
	CGSAddWindowFilter(_CGSDefaultConnection(), [self windowNumber], blurFilterR, 12289);
	NSDictionary* dict = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:1.5] forKey:@"inputRadius"];
	CGSSetCIFilterValuesFromDictionary(_CGSDefaultConnection(), blurFilterR, dict);
}

-(void) orderFront:(id)sender {
	[super orderFront:sender];
	[self applyBlurEffect];
}

@end

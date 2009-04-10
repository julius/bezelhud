//
//  BHWindow.m
//  BezelHUD
//
//  Created by Julius Eckert on 05.05.08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "BHWindow.h"
#import "BlurSetting.h"

int blurFilter = -1;
BHFieldEditor* fEditor = nil;

@implementation BHWindow

-(void) applyBlurEffect {
	if (!SUPPORT_BLURRING) return;
	if (blurFilter != -1) return;
	
	CGSNewCIFilterByName(_CGSDefaultConnection(), (CFStringRef)@"CIGaussianBlur", &blurFilter);
	CGSAddWindowFilter(_CGSDefaultConnection(), [self windowNumber], blurFilter, 12289);
	NSDictionary* dict = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:1.5] forKey:@"inputRadius"];
	CGSSetCIFilterValuesFromDictionary(_CGSDefaultConnection(), blurFilter, dict);
}

-(void) makeKeyAndOrderFront:(id)sender {
	[super makeKeyAndOrderFront:sender];
	[self applyBlurEffect];
}

- (NSTimeInterval)animationResizeTime:(NSRect)newWindowFrame
{
	return 0.05f;
}

//*
-(NSText*) fieldEditor:(BOOL)createWhenNeeded forObject:(id)anObject {
	if (!fEditor) 
		fEditor = [[BHFieldEditor alloc] init];
	//[anObject addSubview:fe];
	return fEditor;
}
/**/

@end

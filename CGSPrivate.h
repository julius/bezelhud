/* CGSPrivate.h -- Header file for undocumented CoreGraphics stuff. */

#pragma once
#ifndef __CGSPrivate
#define __CGSPrivate
#include <Carbon/Carbon.h>

// Internal CoreGraphics typedefs
typedef int		CGSConnection;
typedef int		CGSWindow;
typedef int		CGSValue;

// Transitions we can apply
typedef enum {
	CGSNone = 0,			// No transition effect.
	CGSFade,				// Cross-fade.
	CGSZoom,				// Zoom/fade towards us.
	CGSReveal,				// Reveal new desktop under old.
	CGSSlide,				// Slide old out and new in.
	CGSWarpFade,			// Warp old and fade out revealing new.
	CGSSwap,				// Swap desktops over graphically.
	CGSCube,				// The well-known cube effect.
	CGSWarpSwitch,			// Warp old, switch and un-warp.
	CGSFlip					// Flip over
} CGSTransitionType;

// All our transition styles - passed under "option" when invoking
// Transparent Mask "(1<<7)" goes with option if applied.
typedef enum {
	CGSDown,			// Old desktop moves down.
	CGSLeft,			// Old desktop moves left.
	CGSRight,			// Old desktop moves right.
	CGSInRight,			// CGSSwap: Old desktop moves into screen,
						// new comes from right.
	CGSBottomLeft = 5,	// CGSSwap: Old desktop moves to bottom-left,
						// new comes from top-right.
	CGSBottomRight,		// Old desktop to br, New from tl.
	CGSDownTopRight,	// CGSSwap: Old desktop moves down, new from tr.
	CGSUp,				// Old desktop moves up.
	CGSTopLeft,			// Old desktop moves tl.
	CGSTopRight,		// CGSSwap: old to tr. new from bl.
	CGSUpBottomRight,	// CGSSwap: old desktop up, new from br.
	CGSInBottom,		// CGSSwap: old in, new from bottom.
	CGSLeftBottomRight,	// CGSSwap: old one moves left, new from br.
	CGSRightBottomLeft,	// CGSSwap: old one moves right, new from bl.
	CGSInBottomRight,	// CGSSwap: onl one in, new from br.
	CGSInOut			// CGSSwap: old in, new out.
} CGSTransitionOption;

/* Get the default connection for the current process. */
extern CGSConnection _CGSDefaultConnection(void);

typedef struct {
	uint32_t unknown1;
	CGSTransitionType type;
	CGSTransitionOption option;
	CGSWindow wid;			/* Can be 0 for full-screen */
	float *backColour;	/* Null for black otherwise pointer to 3 float array with RGB value */
} CGSTransitionSpec;

/* Transition handling. */
extern OSStatus CGSNewTransition(const CGSConnection cid, const CGSTransitionSpec* spec, int *pTransitionHandle);
extern OSStatus CGSInvokeTransition(const CGSConnection cid, int transitionHandle, float duration);
extern OSStatus CGSReleaseTransition(const CGSConnection cid, int transitionHandle);


typedef int CGSCIFilterID;

/*! Creates a new CGSCIFilter from a filter name. These names are the same as you'd usually use for CIFilters. */
CG_EXTERN CGError CGSNewCIFilterByName(CGSConnection cid, CFStringRef filterName, CGSCIFilterID *outFilter);

/*! Adds or removes a CIFilter to a window. Flags are currently unknown (the Dock uses 0x3001).
 Note: This stuff is VERY crashy under 10.4.10 - make sure to remove the filter before minimizing the window or closing it. */
CG_EXTERN CGError CGSAddWindowFilter(CGSConnection cid, CGSWindow wid, CGSCIFilterID filter, int flags);
CG_EXTERN CGError CGSRemoveWindowFilter(CGSConnection cid, CGSWindow wid, CGSCIFilterID filter);

/*! Loads a set of values into the CIFilter. */
CG_EXTERN CGError CGSSetCIFilterValuesFromDictionary(CGSConnection cid, CGSCIFilterID filter, CFDictionaryRef filterValues);

/*! Releases a CIFilter. */
CG_EXTERN CGError CGSReleaseCIFilter(CGSConnection cid, CGSCIFilterID filter);

#endif
//
//  ControllerStatusBar.m
//  Auckland
//
//  Created by Dat Anh Truong on 2/17/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import "ControllerStatusBar.h"
#import "StatusView.h"
#import <ApplicationServices/ApplicationServices.h>

@implementation ControllerStatusBar

#pragma mark -
#pragma mark Updating UI
- (id)init
{
    if ((self = [super init]))
	{
    }
	
    return self;
}

- (void)addAController
{
    if (!_controllerItem)
	{
		_controllerItem = [[NSStatusBar systemStatusBar] statusItemWithLength:100];
        [_controllerItem setImage:nil];
        
        _trackingOptions =
        NSTrackingEnabledDuringMouseDrag | NSTrackingMouseEnteredAndExited |
        NSTrackingActiveAlways;
        
        [self addTrackArea:_controllerTrackingArea withValue:1 withKey:@"keyOfTracker" toView:self.actionView];
        [self addTrackArea:_titleTrackingArea withValue:2 withKey:@"keyOfTracker" toView:self.titleView];

		[_controllerItem setView:self.titleView];
    }
}

- (void)addTrackArea:(NSTrackingArea*) trackArea withValue:(int) trackValue withKey:(NSString*) trackKey toView: (StatusView*) desView
{
    NSDictionary* trackerData2 = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [NSNumber numberWithInt: trackValue], trackKey, nil];
    trackArea = [[NSTrackingArea alloc]
                 initWithRect: [desView bounds]
                 options: _trackingOptions
                 owner: self
                 userInfo: trackerData2];
    [desView addTrackingArea: trackArea];
    
}

// -------------------------------------------------------------------------------
//	mouseEntered:event
// -------------------------------------------------------------------------------
//	Because we installed NSTrackingArea with "NSTrackingMouseEnteredAndExited"
//	as an option, this method will be called.
// -------------------------------------------------------------------------------
- (void)mouseEntered:(NSEvent*)event
{
    //    NSLog(@"userData %@", [event userData]);
    //	NSLog(@"in");
    [_controllerItem setView:self.actionView];
}

// -------------------------------------------------------------------------------
//	mouseExited:event
// -------------------------------------------------------------------------------
//	Because we installed NSTrackingArea with "NSTrackingMouseEnteredAndExited",
//	as an option, this method will be called.
// -------------------------------------------------------------------------------
- (void)mouseExited:(NSEvent*)event
{
    //    NSLog(@"userData %@", [event userData]);
    //	NSLog(@"out");
    [_controllerItem setView:self.titleView];
}
@end

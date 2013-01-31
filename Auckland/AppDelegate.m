//
//  AppDelegate.m
//  Auckland
//
//  Created by Dat Anh Truong on 1/28/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import "AppDelegate.h"
#import <QuartzCore/CATransaction.h>
#import <QuartzCore/CAMediaTimingFunction.h>
#import "iTunesController.h"


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    _sysBar = [NSStatusBar systemStatusBar];
    _ourBar = [_sysBar statusItemWithLength:115];
    [_ourBar setView:_barView];
    
    
    trackingOptions = NSTrackingEnabledDuringMouseDrag | NSTrackingMouseEnteredAndExited |
    NSTrackingActiveAlways;
    _trackIt =[[NSTrackingArea alloc] initWithRect:[_barView bounds] options:trackingOptions owner:self
                                            userInfo:nil];
    [_barView addTrackingArea:_trackIt];
    
    
     _track = [[iTunesController sharedInstance] currentTrack];
    
    [_textOnBar setStringValue:[self trackDescription]];
   
          
 
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [[_textOnBar animator] setFrameOrigin:NSMakePoint(0, 3)];
    [CATransaction commit];
}




- (IBAction)atnLogo:(id)sender {
    NSLog(@"Logo");
}

- (IBAction)atnLove:(id)sender {
}

- (IBAction)atnChange:(id)sender {
}


- (IBAction)playPrevious:(id)sender
{
	[[iTunesController sharedInstance] playPrevious];
}


- (IBAction)playPause:(id)sender
{
	[[iTunesController sharedInstance] playPause];
}


- (IBAction)playNext:(id)sender
{
	[[iTunesController sharedInstance] playNext];
}





// -------------------------------------------------------------------------------
//	mouseEntered:event
// -------------------------------------------------------------------------------
//	Because we installed NSTrackingArea with "NSTrackingMouseEnteredAndExited"
//	as an option, this method will be called.
// -------------------------------------------------------------------------------

- (void)mouseEntered:(NSEvent *)theEvent
{
    NSLog(@"Mouse entered %s", [theEvent userData]);
    [_inView setAlphaValue:0.0];
    [_ourBar setView:_inView];
    [[_inView animator] setAlphaValue:1.0];
    
    
    
    _trackIt =[[NSTrackingArea alloc] initWithRect:[_inView bounds] options:trackingOptions owner:self
                                          userInfo:nil];
    [_inView addTrackingArea:_trackIt];

    
} 
// -------------------------------------------------------------------------------
//	mouseExited:event
// -------------------------------------------------------------------------------
//	Because we installed NSTrackingArea with "NSTrackingMouseEnteredAndExited",
//	as an option, this method will be called.
// -------------------------------------------------------------------------------
- (void)mouseExited:(NSEvent *)theEvent
{
    NSLog(@"Mouse exited %s", __FUNCTION__);
    [_barView setAlphaValue:0.0];
    [_ourBar setView:_barView];
    [[_barView animator] setAlphaValue:1.0];
}




- (NSString *)trackDescription
{
	NSString *trackDescription = nil;
	NSString *name = [self.track name];
    NSString *artist = [self.track artist];
    
	if ([name length] && [artist length])
	{
		trackDescription = [NSString stringWithFormat:@"%@ - %@", name, artist];
	}
	else if ([name length])
	{
		trackDescription = name;
	}
	
	return trackDescription;
}


@end

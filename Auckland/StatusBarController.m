//
//  StatusBarController.m
//  MyTunesController
//
//  Created by Dat Anh Truong on 1/28/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//


#import "StatusBarController.h"
#import "iTunesController.h"
#import "StatusView.h"

@interface StatusBarController()
@end

@implementation StatusBarController


// key values for dictionary in NSTrackingAreas's userInfo
enum {
	controller = 1,		// controller tracking area 
	title			// title tracking area 
};
// key for dictionary in NSTrackingAreas's userInfo
NSString* kTrackerKey = @"keyOfTracker";



- (id)init
{
    if ((self = [super init]))
	{
    }
	
    return self;
}


- (void)dealloc
{
}




#pragma mark -
#pragma mark Actions

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


#pragma mark -
#pragma mark Updating UI


- (void)addStatusItems
{
    if (!controllerItem)
	{
		controllerItem = [[NSStatusBar systemStatusBar] statusItemWithLength:100];
        [controllerItem setImage:nil];
        
        trackingOptions =
        NSTrackingEnabledDuringMouseDrag | NSTrackingMouseEnteredAndExited |
        NSTrackingActiveAlways;
		
        
        [self addTrackArea:controllerTrackingArea withValue:controller withKey:kTrackerKey toView:self.statusView];
        [self addTrackArea:titleTrackingArea withValue:title withKey:kTrackerKey toView:self.titleView];
        
        
		[controllerItem setView:self.titleView];
		[self updatePlayButtonState];
	}
    
	if (!mainItem)
	{
		NSImage *statusIcon = [NSImage imageNamed:@"Auckland_Logo.png"];
        NSSize imageSize = { 30.0*(18.0/30.0), 23.0*(18.0/30.0) };
        [statusIcon setSize:imageSize];
		mainItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
		[mainItem setImage:statusIcon];
		[mainItem setHighlightMode:YES];
		
		NSMenu *mainMenu = [[NSMenu alloc] init];
		[mainMenu setAutoenablesItems:NO];
		[mainMenu setDelegate:self];
        //
        //		NSMenuItem *theItem = [mainMenu addItemWithTitle:NSLocalizedString(@"Menu-item-about", nil)
        //                                                  action:@selector(showAboutPanel)
        //                                           keyEquivalent:@""];
        //		[theItem setTarget:[NSApp delegate]];
        //
        //
        //		theItem = [mainMenu addItemWithTitle:NSLocalizedString(@"Menu-item-preferences", nil)
        //                                      action:@selector(showPreferencesWindow)
        //                               keyEquivalent:@""];
        //		[theItem setTarget:[NSApp delegate]];
		
        NSMenuItem *theItem = [mainMenu addItemWithTitle:@"About"
                                                  action:@selector(showAboutPanel)
                                           keyEquivalent:@""];
      	[theItem setTarget:[NSApp delegate]];
        
        
		[mainMenu addItem:[NSMenuItem separatorItem]];
        theItem = [mainMenu addItemWithTitle:@"Preferences"
                                      action:@selector(showPreferences)
                               keyEquivalent:@","];
      	[theItem setTarget:[NSApp delegate]];
        
        [mainMenu addItem:[NSMenuItem separatorItem]];
		
		theItem = [mainMenu addItemWithTitle:@"Quit"
                                      action:@selector(terminate:)
                               keyEquivalent:@"Q"];
		[theItem setTarget:NSApp];
        
		[mainItem setMenu:mainMenu];
	}	
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
    [controllerItem setView:self.statusView];
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
    [controllerItem setView:self.titleView];
}

- (void)updatePlayButtonState
{
	NSImage *playButtonImage = [NSImage imageNamed:[[iTunesController sharedInstance] isPlaying] ? @"Auckland_Pause" : @"Auckland_Play"];
	[self.playButton setImage:playButtonImage];
}

- (void)addTrackArea:(NSTrackingArea*) trackArea withValue:(int) trackValue withKey:(NSString*) trackKey toView: (StatusView*) desView
{
    NSDictionary* trackerData2 = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [NSNumber numberWithInt: trackValue], trackKey, nil];
    trackArea = [[NSTrackingArea alloc]
                 initWithRect: [desView bounds]
                 options: trackingOptions
                 owner: self
                 userInfo: trackerData2];
    [desView addTrackingArea: trackArea];
}


@end

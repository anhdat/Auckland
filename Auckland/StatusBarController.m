//
//  StatusBarController.m
//  MyTunesController
//
//  Created by Dat Anh Truong on 1/28/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//
/*

#import "StatusBarController.h"
#import "StatusView.h"

#import "PBPlayer.h"
#import <ApplicationServices/ApplicationServices.h>


#define kCSViewSideMargin           5
#define kCSViewPauseIconOffset      13
#define kCSViewScrollPadding        20
#define kCSViewScrollDelayInSeconds 3
#define kCSViewScrollTimerFrequency (1.0/30.0)
#define kCSViewScrollStartOffset    (-kCSViewScrollDelayInSeconds/kCSViewScrollTimerFrequency)

@interface StatusBarController()
@property NSArray *players;
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
//	[[iTunesController sharedInstance] playPrevious];
//    for (PBPlayer *player in _players) {
        if ([_currentPlayer previousTrack]) {
            [self updateTitle];
//            break;
        }
//    }
}


- (IBAction)playPause:(id)sender
{
//	[[iTunesController sharedInstance] playPause];
//    
//    for (PBPlayer *player in _players) {
        if ([_currentPlayer togglePlaying])
            [self updatePlayButtonState];
//            break;
//    }
}


- (IBAction)playNext:(id)sender
{
//	[[iTunesController sharedInstance] playNext];
    for (PBPlayer *player in _players) {
        if ([player nextTrack]) {
            [self updateTitle];
            break;
        }
    }
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
        
        
        _players = [[NSArray alloc] initWithObjects:
                   [PBPlayer playerWithBundleIdentifier:@"com.spotify.client"],
                   [PBPlayer playerWithBundleIdentifier:@"com.rdio.desktop"],
                   [PBPlayer playerWithBundleIdentifier:@"com.apple.iTunes"],
                   nil];
        
        [self updateCurrentPlayer];
        
        
        [self updateTitle]; 
        [[NSRunLoop currentRunLoop] addTimer:[NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateTitle) userInfo:nil repeats:YES] forMode:NSRunLoopCommonModes];
        [[NSRunLoop currentRunLoop] addTimer:[NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateCurrentPlayer) userInfo:nil repeats:YES] forMode:NSRunLoopCommonModes];
        

        
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
		
        
        //Add menu items
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
	NSImage *playButtonImage = [NSImage imageNamed:[_currentPlayer isPlaying]?@"Auckland_Pause":@"Auckland_Play"];
    NSImage *altButtonImage = [NSImage imageNamed:[_currentPlayer isPlaying]? @"Auckland_Pause_alt":@"Auckland_Play_alt"];
	[self.playButton setImage:playButtonImage];
    [self.playButton setAlternateImage:altButtonImage];
    NSLog(@"updated");
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


- (void)updateTitle
{
    for (PBPlayer *player in _players) {
        NSString *currentTitle = player.currentTitle;
        if ([currentTitle length]) {
            [_displayText setAlignment:NSLeftTextAlignment];
            [_displayText setStringValue:currentTitle];
            return;
        }
    }
    [_displayText setStringValue:@""];
    [_displayText setAlignment:NSCenterTextAlignment];
}

- (void) updateCurrentPlayer{
    for (PBPlayer *player in _players) {
        if ([player isRunning]) {
            _currentPlayer = player;
            break;
        }
    }
}


- (void)rightMouseDown:(NSEvent *)event
{
    
}


@end
*/
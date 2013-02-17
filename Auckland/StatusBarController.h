//
//  StatusBarController.h
//  MyTunesController
//
//  Created by Dat Anh Truong on 1/28/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "PBPlayer.h"

@class StatusView;

@interface StatusBarController : NSObject <NSMenuDelegate>
{
	NSStatusItem *mainItem;
    NSStatusItem *controllerItem;
	NSMenuItem *progressMenuItem, *toggleFetchingMenuItem;
    NSTrackingAreaOptions trackingOptions;
    NSTrackingArea* controllerTrackingArea;
    NSTrackingArea* titleTrackingArea;
    
}
@property (nonatomic, strong) PBPlayer *currentPlayer;
@property (nonatomic, strong) PBPlayer *iTunesPlayer;
@property (nonatomic, strong) PBPlayer *spotifyPlayer;
@property (nonatomic, strong) PBPlayer *rdioPlayer;

@property (nonatomic, weak) IBOutlet NSButton *playButton;
@property (nonatomic, weak) IBOutlet StatusView *statusView;
@property (nonatomic, weak) IBOutlet StatusView *titleView;

@property (weak) IBOutlet NSTextFieldCell *displayText;
@property (weak) IBOutlet NSTextField *displayTextView;


- (IBAction)playPrevious:(id)sender;
- (IBAction)playPause:(id)sender;
- (IBAction)playNext:(id)sender;
- (void)addTrackArea:(NSTrackingArea*) trackArea withValue:(int) trackValue withKey:(NSString*) trackKey toView: (StatusView*) desView;
- (void)addStatusItems;
- (void)updatePlayButtonState;


@end

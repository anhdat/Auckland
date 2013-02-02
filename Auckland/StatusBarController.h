//
//  StatusBarController.h
//  MyTunesController
//
//  Created by Dat Anh Truong on 1/28/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//



#import <Foundation/Foundation.h>

@class StatusView;

@interface StatusBarController : NSObject <NSMenuDelegate>
{
	NSStatusItem *mainItem, *controllerItem;
	NSMenuItem *progressMenuItem, *toggleFetchingMenuItem;
    NSTrackingAreaOptions trackingOptions;
    NSTrackingArea* controllerTrackingArea;
    NSTrackingArea* titleTrackingArea;
}

@property (nonatomic, weak) IBOutlet NSButton *playButton;
@property (nonatomic, weak) IBOutlet StatusView *statusView;
@property (nonatomic, weak) IBOutlet StatusView *titleView;


- (IBAction)playPrevious:(id)sender;
- (IBAction)playPause:(id)sender;
- (IBAction)playNext:(id)sender;
- (void)addTrackArea:(NSTrackingArea*) trackArea withValue:(int) trackValue withKey:(NSString*) trackKey toView: (StatusView*) desView;
- (void)addStatusItems;
- (void)updatePlayButtonState;


@end

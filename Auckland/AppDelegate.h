//
//  AppDelegate.h
//  Auckland
//
//  Created by Dat Anh Truong on 1/28/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "iTunes.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>{
    NSTrackingAreaOptions trackingOptions;
}

//--------NSView--------------
@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSView *mainView;
@property (weak) IBOutlet NSView *barView;
@property (weak) IBOutlet NSView *inView;
//-----------------------------

//--------Buttons--------------
@property (weak) IBOutlet NSButton *btnLogo;
@property (weak) IBOutlet NSButton *btnPrevious;
@property (weak) IBOutlet NSButton *btnPlay;
@property (weak) IBOutlet NSButton *btnNext;
@property (weak) IBOutlet NSButton *btnLove;
@property (weak) IBOutlet NSButton *btnChange;

- (IBAction)atnLogo:(id)sender;
- (IBAction)atnLove:(id)sender;
- (IBAction)atnChange:(id)sender;

//-----------------------------

@property (weak) IBOutlet NSTextField *textOnBar;


//--------Images--------------
@property (strong, nonatomic) NSImage *imgLogo;
@property (strong, nonatomic) NSImage *imgPrevious;
@property (strong, nonatomic) NSImage *imgPlay;
@property (strong, nonatomic) NSImage *imgNext;
//----------------------------

//--------NSStatusBar--------------
@property (strong, nonatomic) NSStatusBar *sysBar;
@property (strong, nonatomic) NSStatusItem *ourBar;
//-----------------------------

//--------NSTrackingArea--------------
@property (strong, nonatomic) NSTrackingArea *trackIt;

//------------------------------------


@property (nonatomic, strong) iTunesTrack *track;

@end

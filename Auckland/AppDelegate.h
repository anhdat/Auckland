//
//  AppDelegate.h
//  Auckland
//
//  Created by Dat Anh Truong on 1/28/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ControllerStatusBar.h"
#import "IconStatusBar.h"
#import "ChangerStatusBar.h"
#import "ADPlayer.h"
#import "StatusView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSWindowDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet ControllerStatusBar *controllerS;
@property (weak) IBOutlet IconStatusBar *iconS;
@property (weak) IBOutlet ChangerStatusBar *changerS;


@property (nonatomic, strong) ADPlayer *currentPlayer;
- (IBAction)playPrevious:(id)sender;
- (IBAction)playPause:(id)sender;
- (IBAction)playNext:(id)sender;
- (IBAction)star:(id)sender;

- (IBAction)volUp:(id)sender;
- (IBAction)volDown:(id)sender;
// Menu actions

// Managing application windows
- (void)showAboutPanel;

//- (void)showPreferencesWindow;






@end

//
//  AppDelegate.h
//  Auckland
//
//  Created by Dat Anh Truong on 1/28/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "iTunesController.h"
#import "StatusBarController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSWindowDelegate, iTunesControllerDelegate>

@property (assign) IBOutlet NSWindow *window;


@property (nonatomic, weak) IBOutlet StatusBarController *statusBarController;

// Menu actions

// Managing application windows
- (void)showAboutPanel;

//- (void)showPreferencesWindow;






@end

//
//  AppDelegate.m
//  Auckland
//
//  Created by Dat Anh Truong on 1/28/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import "AppDelegate.h"
#import "StatusView.h"
#import "StatusBarController.h"

@interface AppDelegate()


@end


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    //hide dock icon
//    [NSApp setActivationPolicy:NSApplicationActivationPolicyAccessory];
    [NSApp setActivationPolicy: NSApplicationActivationPolicyProhibited];

    
    srand((unsigned int)time(NULL));
    [self.statusBarController addStatusItems];

}




#pragma mark -
#pragma mark Managing Windows

- (void)showAboutPanel
{
	[NSApp orderFrontStandardAboutPanel:self];
	[NSApp activateIgnoringOtherApps:YES];
}

@end

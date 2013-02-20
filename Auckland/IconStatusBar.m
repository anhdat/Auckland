//
//  IconStatusBar.m
//  Auckland
//
//  Created by Dat Anh Truong on 2/17/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import "IconStatusBar.h"

@implementation IconStatusBar
- (void)addIconItem
{
    if (!_mainItem)
    {
        NSImage *statusIcon = [NSImage imageNamed:@"Auckland_Logo.png"];
        NSSize imageSize = { 30.0*(18.0/30.0), 23.0*(18.0/30.0) };
        [statusIcon setSize:imageSize];
        _mainItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
        [_mainItem setImage:statusIcon];
        [_mainItem setHighlightMode:YES];
        
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
        
        [_mainItem setMenu:mainMenu];
    }
}

@end

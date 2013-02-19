//
//  ChangeStatusBar.m
//  Auckland
//
//  Created by Dat Anh Truong on 2/18/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import "ChangerStatusBar.h"

@implementation ChangerStatusBar

- (void) addChangeItem{
    if (!_changeItem){
        NSImage *statusIcon = [NSImage imageNamed:@"Auckland_Change.png"];
        //        NSSize imageSize = { 30.0*(18.0/30.0), 23.0*(18.0/30.0) };
        //        [statusIcon setSize:imageSize];
        _changeItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
        [_changeItem setImage:statusIcon];
        
        NSMenu *mainMenu = [[NSMenu alloc] init];
        [mainMenu setAutoenablesItems:NO];
        [mainMenu setDelegate:self];
        
        
        //Add menu items
        NSMenuItem *theItem = [mainMenu addItemWithTitle:@"iTunes"
                                                  action:@selector(chooseiTunes)
                                           keyEquivalent:@""];
        [theItem setTarget:[NSApp delegate]];
        theItem = [mainMenu addItemWithTitle:@"Spotify"
                                      action:@selector(chooseSpotify)
                               keyEquivalent:@""];
        [theItem setTarget:[NSApp delegate]];
        theItem = [mainMenu addItemWithTitle:@"Rdio"
                                      action:@selector(chooseRdio)
                               keyEquivalent:@""];
        [theItem setTarget:[NSApp delegate]];
        [_changeItem setMenu:mainMenu];
        
    }
}
@end

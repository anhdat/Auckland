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
        [_changeItem setHighlightMode:YES];
        
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
        
        [_changeItem setMenu:mainMenu];
        
    }
}
@end

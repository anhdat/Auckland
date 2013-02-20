//
//  StatusView.m
//  MyTunesController
//
//  Created by Dat Anh Truong on 1/28/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import "StatusView.h"
#import "ADPlayer.h"
@interface StatusView()

@property NSArray *players;
@property ADPlayer *current;
@end
@implementation StatusView

- (void)drawRect:(NSRect)dirtyRect
{
	NSBezierPath *path = [NSBezierPath bezierPathWithRect:dirtyRect];
	[[NSColor clearColor] set];
	[path fill];
}

- (ADPlayer *) returnCurrentPlayer{
    _players = [[NSArray alloc] initWithObjects:
                [ADPlayer playerWithBundleIdentifier:@"com.spotify.client"],
                [ADPlayer playerWithBundleIdentifier:@"com.rdio.desktop"],
                [ADPlayer playerWithBundleIdentifier:@"com.apple.iTunes"],
                nil];
    for (ADPlayer *player in _players) {
        if ([player isRunning]) {
            return player;
        }
    }
    return nil;
}

- (void) volUp{
    if ([self returnCurrentPlayer]) {
        [[self returnCurrentPlayer] volumeUp];
    }
}

- (void) volDown{
    if ([self returnCurrentPlayer]) {
        [[self returnCurrentPlayer] volumeDown];
    }
}

- (void)scrollWheel:(NSEvent *)theEvent{
    if ([theEvent deltaY] < 0) {
        
        [self volUp];
    }
    if ([theEvent deltaY] > 0) {
        [self volDown];
    }
}
@end

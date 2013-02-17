//
//  PBPlayer.h
//  PlayBar
//
//  Created by Ryan Petrich on 11-11-23.
//  Copyright (c) 2011 Ryan Petrich. All rights reserved.
//
//  Created by Dat Anh Truong on 01-11-2013.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface PBPlayer : NSObject {
}

+ (id)playerWithBundleIdentifier:(NSString *)bundleIdentifier;

@property (nonatomic, readonly) NSString *currentTitle;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *artist;
@property (nonatomic, readonly) NSString *album;
@property (nonatomic, readonly) BOOL isRunning;
@property (nonatomic, readonly) BOOL isPlaying;

- (BOOL)togglePlaying;
- (BOOL)nextTrack;
- (BOOL)previousTrack;
@end

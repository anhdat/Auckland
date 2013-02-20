//
//  ADPlayer.h
//  Auckland
//
//  Created by Dat Anh Truong on 2/17/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <ScriptingBridge/ScriptingBridge.h>
#import "iTunes.h"
#import "Rdio.h"
#import "Spotify.h"
#import "Radium.h"

@interface ADPlayer : NSObject
+ (id)playerWithBundleIdentifier:(NSString *)bundleIdentifier;

@property (nonatomic, readonly) NSString *currentTitle;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *artist;
@property (nonatomic, readonly) NSString *album;
@property (nonatomic, readonly) NSInteger *volume;

@property (nonatomic, readonly) BOOL isRunning;
@property (nonatomic, readonly) BOOL isPlaying;
@property (nonatomic, readonly) NSString *appName;

@property (nonatomic, strong) SBApplication *currentADPlayer;

@property (nonatomic, strong)  iTunesApplication *iTunes;
@property (nonatomic, strong) RdioApplication *Rdio;
@property (nonatomic, strong) SpotifyApplication *Spotify;
@property (nonatomic, strong) RadiumApplication *Radium;

- (void) setUp;
- (BOOL)togglePlaying;
- (BOOL)nextTrack;
- (BOOL)previousTrack;
- (BOOL)volumeUp;
- (BOOL)volumeDown;

@end

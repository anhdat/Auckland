//
//  ADPlayer.h
//  Auckland
//
//  Created by Dat Anh Truong on 2/17/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import <Foundation/Foundation.h>

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

- (BOOL)togglePlaying;
- (BOOL)nextTrack;
- (BOOL)previousTrack;
- (BOOL)volumeUp;
- (BOOL)volumeDown;

@end

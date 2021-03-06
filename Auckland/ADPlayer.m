//
//  ADPlayer.m
//  Auckland
//
//  Created by Dat Anh Truong on 2/17/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import "ADPlayer.h"


@interface ADPlayer ()
- (id)initWithBundleIdentifier:(NSString *)bundleIdentifier;

@property NSString *bundleIdentifier;
@property NSAppleScript *titleScript;

@property NSAppleScript *playingScript;
@property NSAppleScript *toggleScript;
@property NSAppleScript *nextScript;
@property NSAppleScript *previousScript;
@property NSAppleScript *volUpScript;
@property NSAppleScript *volDownScript;

@property NSAppleScript *nameScript;
@property NSAppleScript *albumScript;
@property NSAppleScript *artistScript;
@property NSAppleScript *volumeScript;

@property NSRunningApplication *runningApplication;
@end

@implementation ADPlayer

+ (id)playerWithBundleIdentifier:(NSString *)bundleIdentifier
{
    return [[self alloc] initWithBundleIdentifier:bundleIdentifier];
}

- (id)initWithBundleIdentifier:(NSString *)bundleIdentifier
{
    if ((self = [super init])) {
        _bundleIdentifier = [bundleIdentifier copy];
    }
    return self;
}


- (NSRunningApplication *)application
{
    if (_runningApplication.terminated) {
        _runningApplication = nil;
    }
    if (!_runningApplication) {
        _runningApplication = [[NSRunningApplication runningApplicationsWithBundleIdentifier:_bundleIdentifier] lastObject];
    }
    return _runningApplication;
}

- (BOOL) isRunning
{
    NSRunningApplication *app = [self application];
    if (app) {
        return YES;
    } else {
        return NO;
    }
}

- (NSString *) appName
{
    NSRunningApplication *app = [self application];
    if (app) {
        NSString *name = [app localizedName];
        return name;
    } else {
        return nil;
    }
    
}

- (NSString *)currentTitle
{
    NSRunningApplication *app = [self application];
    if (app) {
        if (!_titleScript) {
            NSString *name = [app localizedName];
            NSString *script = [NSString stringWithFormat:@"tell app \"%@\" to return name of current track & \" - \" &  artist of current track", name];
            _titleScript = [[NSAppleScript alloc] initWithSource:script];
            [_titleScript compileAndReturnError:NULL];
        }
        return [[_titleScript executeAndReturnError:NULL] stringValue];
    } else {
        return nil;
    }
}

- (BOOL) isPlaying
{
    NSRunningApplication *app = [self application];
    if (app) {
        if (!_playingScript) {
            NSString *name = [app localizedName];
            NSString *script = [NSString stringWithFormat:@"tell app  \"%@\" to return player state", name];
            _playingScript = [[NSAppleScript alloc] initWithSource:script];
            [_playingScript compileAndReturnError:NULL];
        }
        NSString *result =  [[_playingScript executeAndReturnError:NULL] stringValue];
        if ([result isEqualToString:@"kPSP"]) {
            return YES;
        } else {
            return NO;
        }
    }else {
        return nil;
    }
    
}

- (NSString *)name
{
    NSRunningApplication *app = [self application];
    if (app) {
        if (!_nameScript) {
            NSString *name = [app localizedName];
            NSString *script = [NSString stringWithFormat:@"tell app \"%@\" to return name of current track", name];
            _nameScript = [[NSAppleScript alloc] initWithSource:script];
            [_nameScript compileAndReturnError:NULL];
        }
        return [[_nameScript executeAndReturnError:NULL] stringValue];
    } else {
        return nil;
    }
}
- (NSString *)album
{
    NSRunningApplication *app = [self application];
    if (app) {
        if (!_albumScript) {
            NSString *name = [app localizedName];
            NSString *script = [NSString stringWithFormat:@"tell app \"%@\" to return album of current track", name];
            _albumScript = [[NSAppleScript alloc] initWithSource:script];
            [_albumScript compileAndReturnError:NULL];
        }
        return [[_albumScript executeAndReturnError:NULL] stringValue];
    } else {
        return nil;
    }
}

- (NSString *)artist
{
    NSRunningApplication *app = [self application];
    if (app) {
        if (!_artistScript) {
            NSString *name = [app localizedName];
            NSString *script = [NSString stringWithFormat:@"tell app \"%@\" to return artist of current track", name];
            _artistScript = [[NSAppleScript alloc] initWithSource:script];
            [_artistScript compileAndReturnError:NULL];
        }
        return [[_artistScript executeAndReturnError:NULL] stringValue];
    } else {
        return nil;
    }
}

- (NSInteger *)volume
{
    NSRunningApplication *app = [self application];
    if (app) {
        if (!_volDownScript) {
            NSString *name = [app localizedName];
            NSString *script = [NSString stringWithFormat:@"tell app \"%@\" to return sound volume", name];
            _volDownScript = [[NSAppleScript alloc] initWithSource:script];
            [_volDownScript compileAndReturnError:NULL];
        }
        return [[_volDownScript executeAndReturnError:NULL] int32Value];
    } else {
        return nil;
    }
}

- (BOOL)togglePlaying
{
    NSRunningApplication *app = [self application];
    if (app) {
        if (!_toggleScript) {
            NSString *name = [app localizedName];
            NSString *script = [NSString stringWithFormat:@"tell app \"%@\"\nif player state as string = \"playing\" then\npause\nelse\nplay\nend if\nend tell", name];
            _toggleScript = [[NSAppleScript alloc] initWithSource:script];
            [_toggleScript compileAndReturnError:NULL];
        }
        [_toggleScript executeAndReturnError:NULL];
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)nextTrack
{
    NSRunningApplication *app = [self application];
    if (app) {
        if (!_nextScript) {
            NSString *name = [app localizedName];
            NSString *script = [NSString stringWithFormat:@"tell app \"%@\" to next track", name];
            _nextScript = [[NSAppleScript alloc] initWithSource:script];
            [_nextScript compileAndReturnError:NULL];
        }
        [_nextScript executeAndReturnError:NULL];
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)previousTrack
{
    NSRunningApplication *app = [self application];
    if (app) {
        if (!_previousScript) {
            NSString *name = [app localizedName];
            NSString *script = [NSString stringWithFormat:@"tell app \"%@\" to previous track", name];
            _previousScript = [[NSAppleScript alloc] initWithSource:script];
            [_previousScript compileAndReturnError:NULL];
        }
        [_previousScript executeAndReturnError:NULL];
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)volumeUp
{
    NSRunningApplication *app = [self application];
    if (app) {
        if (!_volUpScript) {
            NSInteger vol = [self volume];
            vol +=10;
            
            NSString *name = [app localizedName];
            NSString *script = [NSString stringWithFormat:@"tell app \"%@\" to set sound volume to %ld", name, vol];
            _volUpScript = [[NSAppleScript alloc] initWithSource:script];
            [_volUpScript compileAndReturnError:NULL];
        }
        [_volUpScript executeAndReturnError:NULL];
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)volumeDown
{
    NSRunningApplication *app = [self application];
    if (app) {
        if (!_volDownScript) {NSInteger vol = [self volume];
            vol -=10;
            
            NSString *name = [app localizedName];
            NSString *script = [NSString stringWithFormat:@"tell app \"%@\" to set sound volume to %ld", name, vol];
            _volDownScript = [[NSAppleScript alloc] initWithSource:script];
            [_volDownScript compileAndReturnError:NULL];
        }
        [_volDownScript executeAndReturnError:NULL];
        return YES;
    } else {
        return NO;
    }
}
@end

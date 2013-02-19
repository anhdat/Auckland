//
//  AppDelegate.m
//  Auckland
//
//  Created by Dat Anh Truong on 1/28/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import "AppDelegate.h"
#import "StatusView.h"
#import "ControllerStatusBar.h"
#import "IconStatusBar.h"

@interface AppDelegate()

@property NSArray *players;
@property NSInteger arguSpo;
@end


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    //hide dock icon
    //    [NSApp setActivationPolicy:NSApplicationActivationPolicyAccessory];
    [NSApp setActivationPolicy: NSApplicationActivationPolicyProhibited];
    _players = [[NSArray alloc] initWithObjects:
                [ADPlayer playerWithBundleIdentifier:@"com.spotify.client"],
                [ADPlayer playerWithBundleIdentifier:@"com.rdio.desktop"],
                [ADPlayer playerWithBundleIdentifier:@"com.apple.iTunes"],
                nil];
    
    srand((unsigned int)time(NULL));
    _arguSpo = 0;
    
    
    [_changerS addChangeItem];
    [_controllerS addAController];
    [_iconS addIconItem];
    
    [self updateCurrentPlayer];
    [self updateTitle];
    [self updatePlayButtonState];
    
    [[NSRunLoop currentRunLoop] addTimer:[NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateTitle) userInfo:nil repeats:YES] forMode:NSRunLoopCommonModes];
    [[NSRunLoop currentRunLoop] addTimer:[NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateCurrentPlayer) userInfo:nil repeats:YES] forMode:NSRunLoopCommonModes];
    
}
- (void) updateCurrentPlayer{
    for (ADPlayer *player in _players) {
        if ([player isRunning]) {
            _currentPlayer = player;
            break;
        }
    }
}

#pragma mark -
#pragma mark Udating Status Infor
- (void)updatePlayButtonState
{
	NSImage *playButtonImage = [NSImage imageNamed:[_currentPlayer isPlaying]?@"Auckland_Pause":@"Auckland_Play"];
    NSImage *altButtonImage = [NSImage imageNamed:[_currentPlayer isPlaying]? @"Auckland_Pause_alt":@"Auckland_Play_alt"];
	[_controllerS.playButton setImage:playButtonImage];
    [_controllerS.playButton setAlternateImage:altButtonImage];
}

- (void)updateTitle
{
    for (ADPlayer *player in _players) {
        NSString *currentTitle = player.currentTitle;
        if ([currentTitle length]) {
            [_controllerS.displayText setAlignment:NSLeftTextAlignment];
            [_controllerS.displayText setStringValue:currentTitle];
            return;
        }
    }
    [_controllerS.displayText setStringValue:@""];
    [_controllerS.displayText setAlignment:NSCenterTextAlignment];
}


#pragma mark -
#pragma mark Managing Windows

- (void)showAboutPanel
{
	[NSApp orderFrontStandardAboutPanel:self];
	[NSApp activateIgnoringOtherApps:YES];
}
- (void)chooseiTunes
{
	NSLog(@"iTunes");
}
- (void)chooseSpotify
{
	NSLog(@"Spotify");
}
- (void)chooseRdio
{
	NSLog(@"Rdio");
}
- (IBAction)playPrevious:(id)sender {
    if ([_currentPlayer previousTrack]) {
        [self updateTitle];
    }
}

- (IBAction)playPause:(id)sender {
    if ([_currentPlayer togglePlaying]){
        [self updatePlayButtonState];
    }
}

- (IBAction)playNext:(id)sender {
    if ([_currentPlayer nextTrack]) {
        [self updateTitle];
    }
}

- (IBAction)star:(id)sender {
}

- (IBAction)volUp:(id)sender{
    [_currentPlayer volumeUp];
}


- (IBAction)volDown:(id)sender{
    [_currentPlayer volumeDown];
}

@end

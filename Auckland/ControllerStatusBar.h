//
//  ControllerStatusBar.h
//  Auckland
//
//  Created by Dat Anh Truong on 2/17/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatusView.h"

@interface ControllerStatusBar : NSObject
@property (nonatomic, strong) NSStatusItem *controllerItem;
@property (nonatomic) NSTrackingAreaOptions trackingOptions;
@property (nonatomic, strong) NSTrackingArea* controllerTrackingArea;
@property (nonatomic, strong) NSTrackingArea* titleTrackingArea;

@property (nonatomic, weak) IBOutlet NSButton *playButton;
@property (nonatomic, weak) IBOutlet StatusView *actionView;
@property (nonatomic, weak) IBOutlet StatusView *titleView;

@property (weak) IBOutlet NSTextFieldCell *displayText;
@property (weak) IBOutlet NSTextField *displayTextView;

- (void)addTrackArea:(NSTrackingArea*) trackArea withValue:(int) trackValue withKey:(NSString*) trackKey toView: (StatusView*) desView;
- (void)addAController;
@end

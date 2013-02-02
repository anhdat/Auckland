//
//  StatusView.m
//  MyTunesController
//
//  Created by Dat Anh Truong on 1/28/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import "StatusView.h"

@implementation StatusView

- (void)drawRect:(NSRect)dirtyRect 
{
	NSBezierPath *path = [NSBezierPath bezierPathWithRect:dirtyRect];
	[[NSColor clearColor] set];
	[path fill];
}

@end

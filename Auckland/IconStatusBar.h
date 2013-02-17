//
//  IconStatusBar.h
//  Auckland
//
//  Created by Dat Anh Truong on 2/17/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatusView.h"
@interface IconStatusBar : NSObject <NSMenuDelegate>
@property (nonatomic, strong) NSStatusItem *mainItem;
- (void)addIconItem;
@end

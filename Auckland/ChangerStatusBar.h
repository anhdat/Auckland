//
//  ChangeStatusBar.h
//  Auckland
//
//  Created by Dat Anh Truong on 2/18/13.
//  Copyright (c) 2013 Dat Anh Truong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatusView.h"
@interface ChangerStatusBar : NSObject <NSMenuDelegate>

@property (nonatomic, strong) NSStatusItem *changeItem;
- (void)addChangeItem;

@end

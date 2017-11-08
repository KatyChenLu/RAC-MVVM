//
//  UIControl+Interval.h
//  HiMaster3
//
//  Created by ChenLu on 2017/11/7.
//  Copyright © 2017年 chenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSTimeInterval MasterDefaultRepeatEventInterval = 1.5;

@interface UIControl (Interval)

@property (nonatomic, assign) NSTimeInterval M_repeatEventInterval;
@end

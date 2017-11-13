//
//  UIControl+Interval.m
//  HiMaster3
//
//  Created by ChenLu on 2017/11/7.
//  Copyright © 2017年 chenlu. All rights reserved.
//

#import "UIControl+Interval.h"
#import <objc/runtime.h>

@implementation UIControl (Interval)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalselector = @selector(sendAction:to:forEvent:);
        SEL swizzledSelector = @selector(M_sendAction:to:forEvent:);
        
        Method originalMethod = class_getInstanceMethod(class, @selector(sendAction:to:forEvent:));
        Method swizzleMethod = class_getInstanceMethod(class, @selector(M_sendAction:to:forEvent:));
        
        BOOL didAddMethod = class_addMethod(class, originalselector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
       
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }else{
            method_exchangeImplementations(originalMethod, swizzleMethod);
        }
        
        
    });
}

- (void)M_sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    static BOOL ignoreEvent = NO;
    if (self.M_repeatEventInterval > 0) {
        if (ignoreEvent) {
            return;
        }else{
            ignoreEvent = YES;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.M_repeatEventInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                ignoreEvent = NO;
            });
            [self M_sendAction:action to:target forEvent:event];
        }
    }else {
        [self M_sendAction:action to:target forEvent:event];
    }
}

- (NSTimeInterval)M_repeatEventInterval {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setM_repeatEventInterval:(NSTimeInterval)M_repeatEventInterval {
     objc_setAssociatedObject(self, @selector(M_repeatEventInterval), @(M_repeatEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

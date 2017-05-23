//
//  Student.m
//  RACRequestTest
//
//  Created by ChenLu on 2017/5/22.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "Student.h"
#import "Teacher.h"
@implementation Student

- (id)forwardingTargetForSelector:(SEL)aSelector {
    Teacher *teacher = [[Teacher alloc] init];
    if ([teacher respondsToSelector:aSelector]) {
        return teacher;
    }
    
    
    return nil;
}

//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
//    if (signature == nil) {
//        signature = []
//    }
//}


@end

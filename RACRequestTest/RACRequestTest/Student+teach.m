//
//  Student+teach.m
//  RACRequestTest
//
//  Created by ChenLu on 2017/5/22.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "Student+teach.h"
//导入头文件
#import <objc/runtime.h>

@implementation Student (teach)
//定义关联的key
static const char *key = "name";

//getter方法
- (NSString *)name {
    //根据key获取关联的值
    return objc_getAssociatedObject(self, key);
}

//setter方法
- (void)setName:(NSString *)name {
    //参数设置
    objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

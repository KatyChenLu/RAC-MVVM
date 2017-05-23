//
//  Student+teach.h
//  RACRequestTest
//
//  Created by ChenLu on 2017/5/22.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "Student.h"

@interface Student (teach)

//不会生成添加属性的getter和setter方法，必须我们手动生成
@property (nonatomic, copy) NSString * name;

@end

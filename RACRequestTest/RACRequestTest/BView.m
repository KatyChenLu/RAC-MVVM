//
//  BView.m
//  RACRequestTest
//
//  Created by ChenLu on 2017/7/13.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "BView.h"

@implementation BView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@" %s",__func__); // 重写touch方法，自己可以响应事件
    [super touchesBegan:touches withEvent:event]; // 在调用系统默认的方法，又把事件顺着响应者链条抛给上一个响应者。这就做到了一个事件，多个控件响应。
}
//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bbb)];
//        
//        [self addGestureRecognizer:tap];
//    }
//    return self;
//}
//
//-(void) bbb {
//    
//    NSLog(@"bbb");
//}

@end

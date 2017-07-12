//
//  MyView.m
//  RACRequestTest
//
//  Created by ChenLu on 2017/7/11.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "MyView.h"

@implementation MyView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)drawRect:(CGRect)rect {
    
    self.backgroundColor = [UIColor whiteColor];
    /*画圆角矩形*/
    float fw = 180;
    float fh = 280;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0, 0, 0, 1.0);
    
    CGContextSetRGBStrokeColor(context, 0, 1, 0, 1.0);
    
    CGContextSetLineWidth(context, 1.0);

    CGContextMoveToPoint(context, fw, fh-20);  // 开始坐标右边开始
    CGContextAddArcToPoint(context, fw, fh, fw-20, fh, 10);  // 右下角角度
    CGContextAddArcToPoint(context, 120, fh, 120, fh-20, 10); // 左下角角度
    CGContextAddArcToPoint(context, 120, 250, fw-20, 250, 10); // 左上角
    CGContextAddArcToPoint(context, 180, 250, 180, 280-20, 10); // 右上角
    CGContextClosePath(context);
//    CGContextAddLineToPoint(context, fw - 10, 250);
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    
    CGContextSetRGBFillColor(context, 0.5,1, 1, 1.0);//画线笔的颜色
    UIFont  *font = [UIFont boldSystemFontOfSize:15.0];//设置
    [@"画圆：" drawInRect:CGRectMake(130, 255, 80, 20) withFont:font];
    
    
    /*图片*/
    UIImage *image = [UIImage imageNamed:@"nav_shanchu"];
    
    [image drawInRect:CGRectMake(fw - 10, 240, 20, 20)];//在坐标中画出图片
}

@end

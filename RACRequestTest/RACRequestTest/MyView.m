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
//    CGContextRef context = UIGraphicsGetCurrentContext();
    /*画圆角矩形*/
    float fw = 180;
    float fh = 280;
    CGContextRef context = UIGraphicsGetCurrentContext();//一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    
    CGContextSetRGBFillColor(context, 1, 0, 0, 1.0);//填充颜色
    
    CGContextSetRGBStrokeColor(context, 0, 1, 0, 1.0);//画线笔的颜色
    
    CGContextSetLineWidth(context, 1.0);//线的宽度
    
    
    
//
    
    CGContextMoveToPoint(context, fw, fh-20);  // 开始坐标右边开始
    CGContextAddArcToPoint(context, fw, fh, fw-20, fh, 10);  // 右下角角度
    CGContextAddArcToPoint(context, 120, fh, 120, fh-20, 10); // 左下角角度
    CGContextAddArcToPoint(context, 120, 250, fw-20, 250, 10); // 左上角
//    CGContextAddArcToPoint(context, 180, 250, 180, 280-20, 10); // 右上角
//    CGContextClosePath(context);
    CGContextAddLineToPoint(context, fw - 20, 250);
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径

//    //椭圆
//    CGRect aRect= CGRectMake(80, 80, 160, 100);
//    CGContextSetRGBStrokeColor(context, 0.6, 0.9, 0, 1.0);
//    CGContextSetLineWidth(context, 3.0);
//    //   CGContextSetFillColorWithColor(context, aColor.CGColor);
//    //   CGContextAddRect(context, rect); //矩形
//    CGContextAddEllipseInRect(context, aRect); //椭圆
//    CGContextDrawPath(context, kCGPathStroke);
//}
}

@end

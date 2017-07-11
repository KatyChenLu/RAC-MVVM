//
//  tabTestViewController.m
//  RACRequestTest
//
//  Created by 陈璐 on 2017/3/16.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "tabTestViewController.h"
#import "MyView.h"


@interface tabTestViewController ()
@end

@implementation tabTestViewController

- (void)viewDidLoad {
    
    MyView *btn = [[MyView alloc] initWithFrame:self.view.frame];
//    [btn setTitle:@"测试透明度" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [btn setBackgroundColor:[UIColor redColor]];
//    btn.layer.borderColor = [UIColor blackColor].CGColor;
//    btn.layer.borderWidth = 1;
//    btn.layer.cornerRadius = 10;

    
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:btn.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerTopLeft cornerRadii:CGSizeMake(10,10)];
//    
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    
//    maskLayer.frame = btn.bounds;
//    
//    maskLayer.path = maskPath.CGPath;
//    
//    btn.layer.mask = maskLayer;
    
    
    
    [self.view addSubview:btn];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(80, -20, 40, 40)];
    view.backgroundColor = [UIColor blackColor];
       view.layer.cornerRadius = 20;
    view.layer.borderColor = [UIColor blackColor].CGColor;
    view.layer.borderWidth = 1;
    [btn addSubview:view];
    
    UIImageView *shanchu = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav_shanchu"]];
    shanchu.frame = CGRectMake(0, 0, 40, 40);
    [view addSubview:shanchu];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

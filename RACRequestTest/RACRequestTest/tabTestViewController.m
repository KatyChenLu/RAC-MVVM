//
//  tabTestViewController.m
//  RACRequestTest
//
//  Created by 陈璐 on 2017/3/16.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "tabTestViewController.h"


@implementation tabTestViewController
__weak NSString *string_weak_ = nil;
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.person = [[Person alloc] init];
//    [self.person addObserver:self forKeyPath:@"name" options:0 context:nil];
    
    // 场景 1
    
    NSString *string = [NSString stringWithFormat:@"lulu"];
    
    string_weak_ = string;
    
    // 场景 2
    
    //    @autoreleasepool {
    
    //        NSString *string = [NSString stringWithFormat:@"lulu"];
    
    //        string_weak_ = string;
    
    //    }
    
    // 场景 3
    
    //    NSString *string = nil;
    
    //    @autoreleasepool {
    
    //        string = [NSString stringWithFormat:@"lulu"];
    
    //        string_weak_ = string;
    
    //    }
    
    NSLog(@"viewDidLoad      string: %@", string_weak_);
    
}
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    NSLog(@"viewWillAppear      string: %@", string_weak_);
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear      string: %@", string_weak_);
    
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    static int number = 0;
////    self.person.name = [NSString stringWithFormat:@"%@",@(number++)];
//    //
//}

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

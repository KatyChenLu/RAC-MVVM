//
//  loginViewModel.m
//  RACRequestTest
//
//  Created by 陈璐 on 2017/3/9.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "loginViewModel.h"
#import "AppDelegate.h"
#import "checkTool.h"

@implementation loginViewModel

- (AccountModel *)account {
    if (_account == nil) {
        _account = [[AccountModel alloc] init];
    }
    return _account;
}
- (instancetype)init {
    if (self = [super init]) {
        [self initialBind];
    }
    return self;
}

- (void)initialBind {
    _enableLoginSignal = [RACSignal combineLatest:@[RACObserve(self.account, username),RACObserve(self.account, pwd)] reduce:^id(NSString *userName, NSString *passWord){
        return @(userName.length && passWord.length);
    }];
    
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSLog(@"点击了登录");
        RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if ([checkTool checkTelNumber:_account.username] && [checkTool checkPassword:_account.pwd]) {
                   [subscriber sendNext:@"login seccess"];
                }else {
                    [subscriber sendNext:@"login fail"];
                }
                
                [subscriber sendCompleted];
            });
            
            return nil;
        }];
        return signal;
    }];
    
    [_loginCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        if ([x isEqualToString:@"login seccess"]) {
            NSLog(@"登陆成功");
        }else if ([x isEqualToString:@"login fail"]){
            NSLog(@"登录失败");
        }
    }];
    [_loginCommand.executing subscribeNext:^(id x) {
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        if ([x isEqualToNumber:@(YES)]) {
            [MBProgressHUD showHUDAddedTo:window animated:YES];
            
        }else{
            [MBProgressHUD hideHUDForView:window animated:YES];
        }
    }];
    
}

@end

@implementation AccountModel


@end

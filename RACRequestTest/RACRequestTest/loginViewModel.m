//
//  loginViewModel.m
//  RACRequestTest
//
//  Created by 陈璐 on 2017/3/9.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "loginViewModel.h"

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
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [subscriber sendNext:@"登陆成功"];
                [subscriber sendCompleted];
            });
            
            return nil;
        }];
        return signal;
    }];
    
}

@end

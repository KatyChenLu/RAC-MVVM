//
//  loginViewModel.h
//  RACRequestTest
//
//  Created by 陈璐 on 2017/3/9.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AccountModel;

@interface loginViewModel : NSObject

@property (nonatomic, strong) AccountModel *account;
@property (nonatomic, strong, readonly) RACCommand *loginCommand;
@property (nonatomic, strong, readonly) RACSignal *enableLoginSignal;

@end

@interface AccountModel : NSObject

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *pwd;

@end

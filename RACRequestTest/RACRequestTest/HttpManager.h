//
//  HttpManager.h
//  RACRequestTest
//
//  Created by 陈璐 on 2017/3/7.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import "AFNetworking.h"

@interface HttpManager : NSObject

SingletonH(HttpManager)

/**
 *  普通网络请求 传入info字典  URL短码 实现成功回调  失败回调
 *
 *  @param infoDic       info字典
 *  @param url           短码
 *  @param opt          post/get
 *  @param success_block 成功回调
 *  @param fail_block    失败回调
 */
-(void )sendRequestWithDic:(NSDictionary *)infoDic opt:(NSString *)opt shortURL:(NSString *)url setSuccessBlock:(void(^)(NSDictionary * responseDic))success_block setFailBlock:(void (^)(id obj))fail_block;

@end

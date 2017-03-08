//
//  HttpManager.m
//  RACRequestTest
//
//  Created by 陈璐 on 2017/3/7.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "HttpManager.h"

@implementation HttpManager

SingletonM(HttpManager)

-(void )sendRequestWithDic:(NSDictionary *)infoDic opt:(NSString *)opt shortURL:(NSString *)url setSuccessBlock:(void(^)(NSDictionary * responseDic))success_block setFailBlock:(void (^)(id obj))fail_block
{
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",BASE_URL,url];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    if ([opt isEqualToString:OPT_POST]) {
        [manager POST:urlStr parameters:infoDic progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary * getDic;
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                getDic = (NSDictionary *)responseObject;
            }else {
                return ;
            }
            
            NSLog(@"__HTTPClient__Success__:%@",getDic);
            
            if (success_block) {
                success_block(getDic);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (fail_block) {
                fail_block(error);
                NSLog(@"__HTTPClient__Failure__:%@",error.localizedDescription);
            }
        }];
    }
    else if ([opt isEqualToString:OPT_GET]){
        [manager GET:urlStr parameters:infoDic progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary * getDic;
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                getDic = (NSDictionary *)responseObject;
            }else {
                return ;
            }
            NSLog(@"__HTTPClient__Success__:%@",getDic);
            
            if (success_block) {
                success_block(getDic);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            if (fail_block) {
                fail_block(error);
                NSLog(@"__HTTPClient__Failure__:%@",error);
            }
        }];
        
    }
}

@end

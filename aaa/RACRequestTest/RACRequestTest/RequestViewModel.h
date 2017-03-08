//
//  RequestViewModel.h
//  RACRequestTest
//
//  Created by 陈璐 on 2017/3/6.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RequestViewModel : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong, readonly) RACCommand *requestCommand;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong, readonly) NSArray *models;

@end

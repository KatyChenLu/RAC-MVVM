//
//  RequestViewModel.m
//  RACRequestTest
//
//  Created by 陈璐 on 2017/3/6.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "RequestViewModel.h"
#import "Book.h"

@implementation RequestViewModel

-(instancetype)init {
    self = [super init];
    if (self) {
        [self getData];
    }
    return self;
}

- (void)getData {
    _requestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
       RACSignal *singal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
           
           NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
           parameters[@"q"] = @"relax";
           [[HttpManager sharedHttpManager] sendRequestWithDic:parameters opt:OPT_GET shortURL:@"v2/book/search" setSuccessBlock:^(NSDictionary *responseDic) {
               // 请求成功调用
               // 把数据用信号传递出去
               [subscriber sendNext:responseDic];
               [subscriber sendCompleted];

           } setFailBlock:^(id obj) {
               
           }];
           return nil;
       }];
        return [singal map:^id(id value) {
            NSMutableArray *dicArray = value[@"books"];
            NSMutableArray *modelArray = [Book objectArrayWithKeyValuesArray:dicArray];
            return modelArray;
        }];
    }];
    
    [_requestCommand.executionSignals.switchToLatest subscribeNext:^(NSArray* model) {
        _models = model;
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    Book *book = self.models[indexPath.row];
    cell.detailTextLabel.text = book.subtitle;
    cell.textLabel.text = book.title;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:book.image]];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end

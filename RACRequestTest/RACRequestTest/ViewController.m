//
//  ViewController.m
//  RACRequestTest
//
//  Created by 陈璐 on 2017/3/6.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "ViewController.h"

#import "RequestViewModel.h"

@interface ViewController ()
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) RequestViewModel *requestVM;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView = [[UITableView alloc ] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStylePlain];
    
    self.tableView.delegate = self.requestVM;
    self.tableView.dataSource = self.requestVM;
    self.requestVM.tableView = _tableView;
    
    [self.view addSubview:self.tableView];
    
    
    // 执行请求
    [self.requestVM.requestCommand execute:nil];
    
}
- (RequestViewModel *)requestVM {
    if (_requestVM == nil) {
        _requestVM =[[RequestViewModel alloc] init];
    }
    return _requestVM;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  llViewController.m
//  RACRequestTest
//
//  Created by 陈璐 on 2017/4/13.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "llViewController.h"
#import "BBDragTable.h"
@interface llViewController ()<BBDragTableDelegate,BBDragTableDataSource>
@property (nonatomic, strong)BBDragTable *tableView;
@property (nonatomic, strong)NSMutableArray *data;
@end

@implementation llViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[BBDragTable alloc] initWithFrame:CGRectMake(0, 0, 300, 500)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self; [self.view addSubview:self.tableView];
    self.data = [NSMutableArray array];
    for (int i = 0; i<10; i++) {
        [self.data addObject:[NSString stringWithFormat:@"%ld",i]];
    }
    
    [self.tableView reloadData];
    
   
}
- (NSArray *)dataArrayForTableView:(BBDragTable *)tableView {
    return self.data;
}
#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
    }
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   return  self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 10;
}
#pragma mark - Public

#pragma mark - Private

#pragma mark - Getter

#pragma mark - Setter

@end

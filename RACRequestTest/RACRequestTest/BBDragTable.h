//
//  BBDragTable.h
//  MyDragTable
//
//  Created by CMMET on 2017/7/26.
//  Copyright © 2017年 34556. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BBDragTable;
@protocol BBDragTableDataSource <UITableViewDataSource>

@required
- (NSArray *)dataArrayForTableView:(BBDragTable *)tableView;
@end
@protocol BBDragTableDelegate <UITableViewDelegate>
@required
- (void)tableView:(BBDragTable *)tableView newArrayDataForDataSource:(NSArray *)newArray;
@optional
/**选中的cell准备好可以移动的时候*/
- (void)tableView:(BBDragTable *)tableView cellReadyToMoveAtIndexPath:(NSIndexPath *)indexPath;
/**选中的cell正在移动，变换位置，手势尚未松开*/
- (void)cellIsMovingInTableView:(BBDragTable *)tableView;
/**选中的cell完成移动，手势已松开*/
- (void)cellDidEndMovingInTableView:(BBDragTable *)tableView;

@end

@interface BBDragTable : UITableView
@property (nonatomic, assign) id<BBDragTableDataSource> dataSource;
@property (nonatomic, assign) id<BBDragTableDelegate> delegate;


@end

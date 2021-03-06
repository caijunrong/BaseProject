//
//  CommTableViewController.h
//  BaseProject
//
//  Created by caijunrong on 15/05/21.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "CommonViewController.h"
#import <MJRefresh.h>

@interface CommTableViewController : CommonViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) BOOL isRefresh;

@property (nonatomic, assign) int page;

//增加刷新功能
- (void)addRefreshFunction;

//网络访问
- (void)getData:(BOOL)isRefresh;

//初始化一个tableview
- (void)initTableView:(BOOL)isgroupTableView;

@end

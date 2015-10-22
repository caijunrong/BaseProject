//
//  CommTableViewController.m
//  BaseProject
//
//  Created by caijunrong on 15/05/21.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "CommTableViewController.h"
@interface CommTableViewController ()

@end

@implementation CommTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化page。自己决定
    self.page = 1;
    
    self.isRefresh = YES;
    
}

- (void)initTableView:(BOOL)isgroupTableView{
    
    if (isgroupTableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    }else{
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }

    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = view;
    
}

- (UITableView *)tableView{
    
    //如果没有初始化的话，默认plain样式
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];

        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = view;
    }

    return _tableView;
}

//增加刷新 & 加载功能
- (void)addRefreshFunction{
    
    __weak typeof(self) weakself = self;
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakself getData:YES];
    }];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakself getData:NO];
    }];
    
    [self.tableView.header beginRefreshing];
}

//网路请求
- (void)getData:(BOOL)isRefresh{
    

}

#pragma mark ---- tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


//
//  ViewControllerA.m
//  BaseProject
//
//  Created by caijunrong on 15/05/20.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "ViewControllerA.h"
#import "ViewControllerB.h"

@interface ViewControllerA ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNeedBackItem = NO;
    self.canSwipeBack = NO;
    
    [self setNavTitle:@"第一个页面"];
    self.navigationItem.rightBarButtonItem = [self rightButtonItemWithTitle:nil orImageString:@"link_shuaxin"];
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    //步骤0:初始化参数
    self.page = 1;
    
    //使用步骤1: 初始化
    [self initTableView:YES];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    //步骤2:设置大小
    [self.tableView setFrame:self.view.frame];
    
    //步骤3:设置要不要加入上下拉功能
    [self addRefreshFunction];
    
    //步骤4:将tableview加入要现实的view
    [self.view addSubview:self.tableView];
    
}

//重写getdata方法
-(void)getData:(BOOL)isRefresh{
    
    [super getData:isRefresh];
    
    if (isRefresh) {
        self.page = 1;
    }
    
    NSMutableDictionary *paramter = [[NSMutableDictionary alloc]init];
    [paramter setObject:[NSString stringWithFormat:@"%d",self.page] forKey:@"pageIndex"];
    [paramter setObject:@"20" forKey:@"pageSize"];
    [paramter setObject:@"0" forKey:@"giftType"];
    [paramter setObject:@"" forKey:@"mallUrl"];
    [paramter setObject:@"" forKey:@"mallLetter"];
    [paramter setObject:@"0" forKey:@"mallNation"];
    
    
    [self.appDataHelper getPostListDataWithUrl:[self.apiUtil getUrlWithApi:@"GetGiftListQueryJson"] AndParameter:paramter AndIsRefrresh:isRefresh RefreshSuccess:^(NSArray *dateArray) {
        
        if (!self.dataArray) {
            self.dataArray = [[NSMutableArray alloc]init];
        }
        
        for (NSDictionary *dic in dateArray) {
            [self.dataArray addObject:dic];
        }
        
        self.page ++;
        
        [self.tableView reloadData];
        
        NSLog(@"RefreshSuccess");
    } RefreshFailure:^{
        NSLog(@"RefreshFailure");
    } RefreshEmpty:^{
        NSLog(@"RefreshEmpty");
    } LoadMoreSuccess:^(NSArray *dataArray) {
        
        for (NSDictionary *dic in dataArray) {
            [self.dataArray addObject:dic];
        }
        self.page ++;
        
        [self.tableView reloadData];
        NSLog(@"LoadMoreSuccess");
    } LoadMoreFailure:^{
        NSLog(@"LoadMoreFailure");
    } LoadMoreEmpty:^{
        NSLog(@"LoadMoreEmpty");
    } Complete:^{
        NSLog(@"Complete");
        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];
    }];

}

#pragma mark ---- tableview delegate

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
    [view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 5)];
    [view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"self.dataArray.count:%d",(int)self.dataArray.count);
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"测试数据%d",(int)indexPath.row]];
    [cell.textLabel setTextColor:[UIColor darkGrayColor]];
    return cell;
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"--");
}


- (void)righBarClick{
    [super righBarClick];
    ViewControllerB *secondController = [[ViewControllerB alloc]init];
    secondController.isNeedBackItem = NO;
    [self.navigationController pushViewController:secondController animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

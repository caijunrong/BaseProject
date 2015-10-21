//
//  CommonViewController.m
//  BaseProject
//
//  Created by caijunrong on 15/05/19.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "CommonViewController.h"
#import "AppDataHelper.h"
#import "JRBarButtonItem.h"

@interface CommonViewController ()


@end

@implementation CommonViewController

+ (id)controller
{
    return [[self alloc] init];
}

- (id)init{
    
    self = [super init];
    
    if (self) {
        //默认值
        self.isNeedBackItem = YES;
        self.hasNav = YES;
        self.canSwipeBack = YES;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.isNeedBackItem = YES;
        self.hasNav = YES;
        self.canSwipeBack = YES;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _apiUtil = [APIUtil sharedInstance];
    
    _appDataHelper = [AppDataHelper sharedInstance];
    
    
    //滑动返回
    [self initSwipeBack];
    
    NSMutableDictionary *paramter = [[NSMutableDictionary alloc]init];
    [paramter setObject:[NSString stringWithFormat:@"%d",1] forKey:@"pageIndex"];
    [paramter setObject:@"20" forKey:@"pageSize"];
    [paramter setObject:@"0" forKey:@"giftType"];
    [paramter setObject:@"" forKey:@"mallUrl"];
    [paramter setObject:@"" forKey:@"mallLetter"];
    [paramter setObject:@"0" forKey:@"mallNation"];
    
    //http://mws.biyabi.com/webservice.asmx/GetGiftListQueryJson
    //[_apiUtil getUrlWithApi:@"GetGiftListQueryJson"]
    [_appDataHelper getPostListDataWithUrl:[_apiUtil getUrlWithApi:@"GetGiftListQueryJson"] AndParameter:paramter AndIsRefrresh:YES RefreshSuccess:^(NSArray *dateArray) {
        NSLog(@"RefreshSuccess");
    } RefreshFailure:^{
        NSLog(@"RefreshFailure");
    } RefreshEmpty:^{
        NSLog(@"RefreshEmpty");
    } LoadMoreSuccess:^(NSArray *dataArray) {
        NSLog(@"LoadMoreSuccess");
    } LoadMoreFailure:^{
        NSLog(@"LoadMoreFailure");
    } LoadMoreEmpty:^{
        NSLog(@"LoadMoreEmpty");
    } Complete:^{
        NSLog(@"Complete");
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (self.isNeedBackItem) {
        
        JRBarButtonItem *item = [JRBarButtonItem itemWithTitle:nil imageString:nil style:JRNavItemStyleBack target:self action:@selector(backForePage)];
        
        self.navigationItem.leftBarButtonItem = item;
    }

}

- (void)initSwipeBack{
    //添加轻扫手势
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    //设置轻扫的方向
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight; //默认向右
    [self.view addGestureRecognizer:swipeGesture];
    if ([APPTool isForbitSildeBack]) {
        [self closeSwipeBack];
    }

}

#pragma mark关闭滑动返回
-(void)closeSwipeBack{
    _canSwipeBack = NO;
}

//轻扫手势触发方法
-(void)swipeGesture:(id)sender
{
    UISwipeGestureRecognizer *swipe = sender;
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        //向左轻扫做的事情
        //        [self clickBackBn];
    }
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight)
    {
        //向右轻扫做的事情
        if (_canSwipeBack) {
            [self backForePage];
        }
        
    }
}

//重新计算frame
- (CGRect)visibleBoundsShowNav:(BOOL)hasNav showTabBar:(BOOL)hasTabBar
{
    CGRect frame = [[UIScreen mainScreen] bounds];
    if (hasNav) {
        frame.size.height -= 20;
        frame.size.height -= 44;
    }
    if (hasTabBar) {
        frame.size.height -= 48;
    }
    return frame;
}

//navigation的抬头
- (void)setNavTitle:(NSString *)title
{
    UILabel *_titleView = [[UILabel alloc] init];
    _titleView.textColor = NavTextTintColor;
    //        _titleView.shadowColor = [UIColor navTintColor];
    _titleView.backgroundColor = [UIColor clearColor];
    _titleView.font = [UIFont systemFontOfSize:BigTitleTextSize];
    _titleView.textAlignment = NSTextAlignmentCenter;
    CGRect frame = _titleView.frame;

    _titleView.frame = CGRectMake(frame.origin.x, 5, frame.size.width, 34);
    self.navigationItem.titleView = _titleView;
    _titleView.text = title;

}

//实例化一个UIBarButtonItem
- (UIBarButtonItem *)rightButtonItemWithTitle:(NSString *)title orImageString:(NSString *)imageString{
    if (!_rightBtnItem) {
        _rightBtnItem = [JRBarButtonItem itemWithTitle:title imageString:imageString style:JRNavItemStyleCustom target:self action:@selector(righBarClick)];
    }
    return _rightBtnItem;
}

//按钮：右边的nav Item
- (void)righBarClick{
    NSLog(@"Click NavigationBar Right Button Item");
}

//返回上一页
- (void)backForePage{
    NSLog(@"Click NavigationBar left Button Item");
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  CommonViewController.m
//  BaseProject
//
//  Created by caijunrong on 15/05/19.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "CommonViewController.h"
#import "AppDataHelper.h"

@interface CommonViewController ()

@property (nonatomic, strong) APIUtil *apiUtil;

@property (nonatomic, strong) AppDataHelper *appDataHelper;

@end

@implementation CommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary *paramter = [[NSMutableDictionary alloc]init];
    [paramter setObject:[NSString stringWithFormat:@"%d",1] forKey:@"pageIndex"];
    [paramter setObject:@"20" forKey:@"pageSize"];
    [paramter setObject:@"0" forKey:@"giftType"];
    [paramter setObject:@"" forKey:@"mallUrl"];
    [paramter setObject:@"" forKey:@"mallLetter"];
    [paramter setObject:@"0" forKey:@"mallNation"];
    
    _apiUtil = [APIUtil sharedInstance];
    
    _appDataHelper = [AppDataHelper sharedInstance];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

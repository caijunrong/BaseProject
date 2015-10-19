//
//  APIUtil.m
//  BaseProject
//
//  Created by caijunrong on 15/05/19.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#define APIKey @"api"
#define SearchAPIKey @"searchApi"

#import "APIUtil.h"
#import "NSString+PJR.h"

//#import "ApiInfoModel.h"

@implementation APIUtil

@synthesize baseUrl = _baseUrl;
NSUserDefaults *defaults;
NSArray *apiarr;

static APIUtil *apiUtils;
int count = 0;
int searchApiCount = 0;

/*
 *  单例模式，返回对象
 */
+ (APIUtil *)sharedInstance{
    defaults = [NSUserDefaults standardUserDefaults];
    apiarr = [defaults objectForKey:APIKey];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        apiUtils = [[self alloc]init];
    });
    
    return apiUtils;
}

/*
 *  初始化API
 */
- (void)initApiWithArray:(NSArray *)array{
    _baseSearchUrl = [defaults objectForKey:APIKey];
    if (apiarr==nil||apiarr.count==0) {
        [defaults setObject:array forKey:APIKey];
        [defaults synchronize];
        _baseUrl = array[0];
    }else{
        _baseUrl = apiarr[0];
    }
    
}

/*
 *   修改API
 */
- (void)changeApi{
    if (apiarr==nil||apiarr.count ==0) {
        apiarr = [defaults objectForKey:APIKey];
    }
    count++;
    if (count==apiarr.count) {
        count = 0;
    }
    _baseUrl = apiarr[count];
    
    [self setIsShouldCheckApiInfo:YES];
}

/*
 *  设置基础API
 */
- (void)setApiWithArray:(NSArray *)array{
    [defaults setObject:array forKey:APIKey];
    [defaults synchronize];
}

/*
 *获取带基础http的API
 */
- (NSString *)getUrlWithApi:(NSString *)api{
    //    _baseUrl = @"192.168.1.138:8080";
    return [NSString stringWithFormat:@"http://%@/webservice.asmx/%@",[_baseUrl removeWhiteSpacesFromString],api];
}

/*
 *  检查基础API，网络访问更新API
 */
- (void)checkApiInfo{
    if([self IsShouldCheckApiInfo]){
        
        //检查API,其实就是从服务器上取回API，更新本地的API的IP
        
//        [[AppDataHelper sharedInstance]checkUpdateSuccess:^(AppInfoModel *appInfo) {
//            NSString *apiip = appInfo.ApiIP;
//            [self setIsShouldCheckApiInfo:NO];
//            NSArray *apiarray = [apiip componentsSeparatedByString:@","];
//            apiarr = apiarray;
//            [self setApiWithArray:apiarray];
//            NSArray *soApiArray = [appInfo.SoApi componentsSeparatedByString:@","];
//            _searchURLArray = soApiArray;
//            [self setSearchApiWithArray:_searchURLArray];
//        } Failure:^{
//        
//        }];
    }

}

/*
 *  获取baseUrl
 */
- (NSString *)CurrentIP{
    return _baseUrl;
}

#pragma mark设置是否应该检查ApiInfo
-(void)setIsShouldCheckApiInfo:(BOOL)value
{
    [defaults setBool:value forKey:@"IsShouldCheckApiInfo"];
    [defaults synchronize];
}

-(BOOL)IsShouldCheckApiInfo{
    return [defaults boolForKey:@"IsShouldCheckApiInfo"];
}


//------------------- 以下是搜索功能用的,(服务器的人搞出来的，坑爹) --------------------
//PS:如果是别的项目可以不用理会
/*
 *  初始化搜索API，没办法搜索API比较特殊
 */
- (void)initSearchApiWithArray:(NSArray *)array{
    _searchURLArray = [defaults objectForKey:SearchAPIKey];
    if (_searchURLArray==nil||_searchURLArray.count==0) {
        [defaults setObject:array forKey:SearchAPIKey];
        [defaults synchronize];
        _baseSearchUrl = array[0];
    }else{
        _baseSearchUrl = _searchURLArray[0];
    }
}

/*
 *  改变搜索API，API不可用时，动态改变
 */
- (void)changeSearchApi{
    if (_searchURLArray ==nil||_searchURLArray.count==0) {
        _searchURLArray = [defaults objectForKey:SearchAPIKey];
    }
    searchApiCount++;
    if (searchApiCount == _searchURLArray.count) {
        searchApiCount=0;
    }
    _baseSearchUrl = _searchURLArray[searchApiCount];
}

/*
 *  获取带基础http的API（搜索接口使用）
 */
- (NSString *)getSearchUrlWithApi:(NSString *)api{
    return [NSString stringWithFormat:@"http://%@/soservice.asmx/%@",[_baseSearchUrl removeWhiteSpacesFromString],api];
}

/*
 *  设置搜索API
 */
-(void)setSearchApiWithArray:(NSArray *)array{
    [defaults setObject:array forKey:SearchAPIKey];
    [defaults synchronize];
}

@end

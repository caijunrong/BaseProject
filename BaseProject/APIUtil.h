//
//  APIUtil.h
//  BaseProject
//  作用：获取API接口地址，在街口不可用的时候会自动切换API接口
//  Created by caijunrong on 15/05/19.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIUtil : NSObject

//基础url,通用
@property (nonatomic, copy) NSString *baseUrl;

//搜索页用的URL，与基础URL不同
@property (nonatomic, copy) NSString *baseSearchUrl;

//搜索页的URL数组
@property (nonatomic, strong) NSArray *searchURLArray;


+ (APIUtil *)sharedInstance;



//通用初始化基础API方法，一般在启动时调用
- (void)initApiWithArray:(NSArray *)array;

//改变基础API，API不可用时，动态改变
//是否允许改变API
- (void)setIsShouldCheckApiInfo:(BOOL)value;

//检查基础API
- (void)checkApiInfo;

//设置基础API
- (void)setApiWithArray:(NSArray *)array;

//获取带基础http的API
- (NSString *)getUrlWithApi:(NSString *)api;

//获取baseUrl
- (NSString *)CurrentIP;


//------------------- 以下是搜索功能用的,(服务器的人搞出来的，坑爹) --------------------
//PS:如果是别的项目可以不用理会
//初始化搜索API，没办法搜索API比较特殊
- (void)initSearchApiWithArray:(NSArray *)array;

//改变搜索API，API不可用时，动态改变
- (void)changeSearchApi;

//获取带基础http的API（搜索接口使用）
- (NSString *)getSearchUrlWithApi:(NSString *)api;

//设置搜索API
-(void)setSearchApiWithArray:(NSArray *)array;

@end

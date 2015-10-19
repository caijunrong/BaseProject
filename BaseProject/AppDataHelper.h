//
//  AppDataHelper.h
//  BaseProject
//
//  Created by caijunrong on 15/05/19.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperationManager;

@interface AppDataHelper : NSObject

//网络访问manager
@property(nonatomic, strong) AFHTTPRequestOperationManager *manager;

//API工具类
@property(nonatomic, strong) APIUtil *apiUtil;

//网络访问超时时间
@property (nonatomic, assign) NSInteger timeout;


//初始化
-(id)init;

/*
 *  单例
 */
+(AppDataHelper *)sharedInstance;

//================ POST ==================

/*
 *  获取列表数据: 数组专用(POST)
 */
-(void)getPostListDataWithUrl:(NSString *)url AndParameter:(NSDictionary *)parameter AndIsRefrresh:(BOOL)isRefresh RefreshSuccess:(void(^)(NSArray *dateArray))refreshSuccess RefreshFailure:(void(^)())refreshFailure RefreshEmpty:(void(^)())refreshEmpty LoadMoreSuccess:(void(^)(NSArray *dataArray))loadmoreSuccess LoadMoreFailure:(void(^)())loadmoreFailure LoadMoreEmpty:(void(^)())loadmoreEmpty Complete:(void(^)())complete;

/*
 *  获取正常情况下的POST网络数据，因为有多种形式，所以具体怎么解析看具体要求(非数组)
 */
- (void)getPostNormalDataWithUrl:(NSString *)url AndParameter:(NSDictionary *)parameter Success:(void (^)(id))success Failure:(void (^)())failure;

/*
 *  获取正常情况下的POST网络数据,带解析(非数组)
 */
- (void)getPostNarmalDataWithUrl:(NSString *)url AndParameter:(NSDictionary *)parameter ResultSuccess:( void (^)(id))success ResultFailure:( void(^)())failure ResultEmpty:(void(^)())empty;

//================ GET ==================

/*
 *  获取列表数据: 数组专用(GET)
 */
-(void)getGETMethodListDataWithUrl:(NSString *)url AndParameter:(NSDictionary *)parameter AndIsRefrresh:(BOOL)isRefresh RefreshSuccess:(void(^)(NSArray *dateArray))refreshSuccess RefreshFailure:(void(^)())refreshFailure RefreshEmpty:(void(^)())refreshEmpty LoadMoreSuccess:(void(^)(NSArray *dataArray))loadmoreSuccess LoadMoreFailure:(void(^)())loadmoreFailure LoadMoreEmpty:(void(^)())loadmoreEmpty Complete:(void(^)())complete;

/*
 *  获取正常情况下的GET网络数据，因为有多种形式，所以具体怎么解析看具体要求(非数组)
 */
- (void)getGETMethodNormalDataWithUrl:(NSString *)url AndParameter:(NSDictionary *)parameter Success:(void (^)(id))success Failure:(void (^)())failure;


//================ CANCEL ==================

/*
 *  终止网络请求
 */
-(void)cancelRequest;


@end

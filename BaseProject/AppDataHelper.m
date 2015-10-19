//
//  AppDataHelper.m
//  BaseProject
//
//  Created by caijunrong on 15/05/19.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "AppDataHelper.h"
#import "RegExCategories.h"
#import <AFNetworking.h>

//正则判断，以下条件全部当作是空
#define EmptyRegEx @"\\[\\]|\\[\\{\\}\\]|^$|^null|^NULL|^nil"

#define VerifyErrorRegEx @"Verify Error"

@implementation AppDataHelper
static AppDataHelper *dataHelper;

- (instancetype)init{
    if (self = [super init]) {
        
        _apiUtil = [APIUtil sharedInstance];
        
        _manager = [AFHTTPRequestOperationManager manager];
        
        //序列化结果
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [_manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        
        _manager.requestSerializer.timeoutInterval = 10;//超时时间默认10s
        
        [_manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        
    }
    return  self;
}

//返回单例对象
+ (AppDataHelper *)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataHelper = [[self alloc]init];
    });
    return dataHelper;
}


//重新设置超时时间
- (void)setTimeout:(NSInteger)timeout{
    
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [_manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    
    _manager.requestSerializer.timeoutInterval = timeout;//重新设置超时时间
    
    [_manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];

}

/*
 *  获取列表数据: 数组专用(POST)
 */
-(void)getPostListDataWithUrl:(NSString *)url AndParameter:(NSDictionary *)parameter AndIsRefrresh:(BOOL)isRefresh RefreshSuccess:(void(^)(NSArray *dateArray))refreshSuccess RefreshFailure:(void(^)())refreshFailure RefreshEmpty:(void(^)())refreshEmpty LoadMoreSuccess:(void(^)(NSArray *dataArray))loadmoreSuccess LoadMoreFailure:(void(^)())loadmoreFailure LoadMoreEmpty:(void(^)())loadmoreEmpty Complete:(void(^)())complete{
    
    NSLog(@"API's URL is:%@",url);
    NSLog(@"API' parameter is%@",parameter);

    [_manager POST:url parameters:parameter success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        //先转化成字符串 判断是否正常(防止Crash必备，别把希望全部放在做服务器的人身上)
        NSString *responseString = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        
        if ([RX(VerifyErrorRegEx) isMatch:responseString]) {
            //情况1:出错了
            complete();
            if (isRefresh) {
                refreshFailure();
            }else{
                loadmoreFailure();
            }
        }else if (![RX(EmptyRegEx) isMatch:responseString]) {
            //情况2:返回数据正常
            NSArray *infoArray = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            complete();
            if (isRefresh) {
                refreshSuccess(infoArray);
            }else{
                loadmoreSuccess(infoArray);
            }
        }else{
            //情况3:返回数据为空
            complete();
            if (isRefresh) {
                refreshEmpty();
            }else{
                loadmoreEmpty();
            }
        }
        
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        if (isRefresh) {
            refreshFailure();
        }else{
            loadmoreFailure();
        }
        complete();

    }];
}

/*
 *  获取正常情况下的POST网络数据，因为有多种形式，所以具体怎么解析看具体要求(非数组)
 */
- (void)getPostNormalDataWithUrl:(NSString *)url AndParameter:(NSDictionary *)parameter Success:(void (^)(id))success Failure:(void (^)())failure{
    
    [_manager POST:url parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"postNetDataWithUrl:%@-success",url);
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"postNetDataWithUrl:%@-failure:%@",url,error.userInfo);
        failure();
    }];
}

/*
 *  获取正常情况下的POST网络数据,带解析(非数组)
 */
- (void)getPostNarmalDataWithUrl:(NSString *)url AndParameter:(NSDictionary *)parameter ResultSuccess:( void (^)(id))success ResultFailure:( void(^)())failure ResultEmpty:(void(^)())empty{
    [_manager POST:url parameters:parameter success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSLog(@"postNetDataWithUrl:%@-success",url);
        NSLog(@"postNetDataWithUrl:%@",responseObject);
        
        NSString *responseString = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        if ([RX(VerifyErrorRegEx) isMatch:responseString]) {
            //情况1:出错了
            failure();
        }else if (![RX(EmptyRegEx) isMatch:responseString]) {
            //情况2:返回数据正常
            success(responseObject);
        }else{
            //情况3:返回数据为空
            empty();
        }
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"postNetDataWithUrl:%@-failure:%@",url,error.userInfo);
        
        failure();
        
    }];

}

#pragma mark GET Method
-(void)getGETMethodListDataWithUrl:(NSString *)url AndParameter:(NSDictionary *)parameter AndIsRefrresh:(BOOL)isRefresh RefreshSuccess:(void(^)(NSArray *dateArray))refreshSuccess RefreshFailure:(void(^)())refreshFailure RefreshEmpty:(void(^)())refreshEmpty LoadMoreSuccess:(void(^)(NSArray *dataArray))loadmoreSuccess LoadMoreFailure:(void(^)())loadmoreFailure LoadMoreEmpty:(void(^)())loadmoreEmpty Complete:(void(^)())complete{
    
    NSLog(@"API's URL is:%@",url);
    NSLog(@"API' parameter is%@",parameter);
    
    [_manager GET:url parameters:parameter success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        //先转化成字符串 判断是否正常(防止Crash必备，别把希望全部放在做服务器的人身上)
        NSString *responseString = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        
        if ([RX(VerifyErrorRegEx) isMatch:responseString]) {
            //情况1:出错了
            complete();
            if (isRefresh) {
                refreshFailure();
            }else{
                loadmoreFailure();
            }
        }else if (![RX(EmptyRegEx) isMatch:responseString]) {
            //情况2:返回数据正常
            NSArray *infoArray = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            complete();
            if (isRefresh) {
                refreshSuccess(infoArray);
            }else{
                loadmoreSuccess(infoArray);
            }
        }else{
            //情况3:返回数据为空
            complete();
            if (isRefresh) {
                refreshEmpty();
            }else{
                loadmoreEmpty();
            }
        }
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        if (isRefresh) {
            refreshFailure();
        }else{
            loadmoreFailure();
        }
        complete();
        
    }];

}

/*
 *  获取正常情况下的GET网络数据，因为有多种形式，所以具体怎么解析看具体要求(非数组)
 */
- (void)getGETMethodNormalDataWithUrl:(NSString *)url AndParameter:(NSDictionary *)parameter Success:(void (^)(id))success Failure:(void (^)())failure{
    
    [_manager GET:url parameters:parameter success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"postNetDataWithUrl:%@-success",url);
        success(responseObject);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"postNetDataWithUrl:%@-failure:%@",url,error.userInfo);
        failure();
    }];
}





#pragma mark终止网络请求
-(void)cancelRequest{
    [_manager.operationQueue cancelAllOperations];
}





@end

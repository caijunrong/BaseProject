//
//  APPTool.m
//  BaseProject
//
//  Created by caijunrong on 15/05/20.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "APPTool.h"

@implementation APPTool
NSUserDefaults *userDefaults;


+(APPTool *)sharedInstance{
    static dispatch_once_t onceToken;
    static APPTool *appTool;
    dispatch_once(&onceToken, ^{
        appTool = [[self alloc]init];
    });
    userDefaults = [NSUserDefaults standardUserDefaults];
    return appTool;
}

#pragma mark获取能否滑动返回数据
+(BOOL)isForbitSildeBack{
    if (userDefaults == Nil) {
        userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return [userDefaults boolForKey:@"com.app.forbitslideback"];
}

#pragma mark设置能否滑动返回
+(void)setForbitSlideBack:(BOOL)isForbit{
    //亲，默认是not，允许开启滑动返回
    if (userDefaults == Nil) {
        userDefaults = [NSUserDefaults standardUserDefaults];
    }
    [userDefaults setBool:isForbit forKey:@"com.app.forbitslideback"];
    [userDefaults synchronize];
}

@end

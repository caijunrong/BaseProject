//
//  APPTool.h
//  BaseProject
//
//  Created by caijunrong on 15/05/20.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPTool : NSObject

+ (APPTool *)sharedInstance;

#pragma mark获取能否滑动返回数据
+(BOOL)isForbitSildeBack;

#pragma mark设置能否滑动返回
+(void)setForbitSlideBack:(BOOL)isForbit;  //亲，默认是not，允许开启滑动返回

@end

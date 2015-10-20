//
//  CommonViewController.h
//  BaseProject
//
//  Created by caijunrong on 15/05/19.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppDataHelper;
@class APIUtil;

@interface CommonViewController : UIViewController


@property (nonatomic, strong) APIUtil *apiUtil;

@property (nonatomic, strong) AppDataHelper *appDataHelper;

//是否显示左边的navigationBar的返回按钮
@property (nonatomic, assign) BOOL              isNeedBackItem; //default is YES;

//是否有nav
@property (nonatomic, assign) BOOL              hasNav; //default is YES;

//右边的NavigationBar的Item
@property (nonatomic, strong) UIBarButtonItem   *rightBtnItem;

//是否能手势滑动返回
@property(nonatomic)BOOL canSwipeBack;


+ (id)controller;

//按钮：右边的nav Item
- (void)righBarClick;

//设置NavTitle
- (void)setNavTitle:(NSString *)title;

//实例化一个UIBarButtonItem
- (UIBarButtonItem *)rightButtonItemWithTitle:(NSString *)title orImageString:(NSString *)imageString;

//工具方法计算visibileRect
- (CGRect)visibleBoundsShowNav:(BOOL)hasNav showTabBar:(BOOL)hasTabBar;

//增加滑动返回
- (void)initSwipeBack;
@end

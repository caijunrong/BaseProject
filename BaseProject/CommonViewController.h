//
//  CommonViewController.h
//  BaseProject
//
//  Created by caijunrong on 15/05/19.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDataHelper.h"
#import "JRBarButtonItem.h"
#import "PromptView.h"

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
@property (nonatomic, assign) BOOL canSwipeBack;

//网络加载失败
@property (nonatomic, strong) PromptView *promptNetErrorView;

//搜索为空
@property (nonatomic, strong) PromptView *promptSearchEmptyView;

//商品为空
@property (nonatomic, strong) PromptView *promptGoodsEmptyView;

//评论为空
@property (nonatomic, strong) PromptView *promptReviewEmptyView;

//消息为空
@property (nonatomic, strong) PromptView *promptMessageEmptyView;

//成功支付
@property (nonatomic, strong) PromptView *promptPaySuccessView;

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

//点击了网络出错重新加载按钮，需要进行的网路操作
- (void)reloadDetailData;
@end

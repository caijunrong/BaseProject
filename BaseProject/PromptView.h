//
//  PromptView.h
//  BaseProject
//
//  Created by caijunrong on 15/05/21.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PromptView : UIView
{
    void (^promptLeftBtnClick)();
    void (^promptRightBtnClick)();
}

- (void)setPromptLeftBtnClickBlock:( void(^)() )myBlocks;
- (void)setPromptRightBtnClickBlock:( void(^)() )myBlocks;

//下面常用情况不能满足，使用自定义提示
- (instancetype) initWithFrame:(CGRect)frame AndTitleImage:(UIImage *)titleImage AndMainString:(NSString *)mainStr AndSubString:(NSString *)subString AndLeftButtonString:(NSString *)leftBtnStr AndRightButtonString:(NSString *)rightBtnStr;

//网络加载出错
+ (PromptView *)promptNetErrorView:(CGRect)frame AndRightBtnClickBlock:( void(^)())rightBlock;

//搜索为空
+ (PromptView *)promptSearchEmptyView:(CGRect)frame;

//商品为空
+ (PromptView *)promptGoodsEmptyView:(CGRect)frame;

//评论为空
+ (PromptView *)promptReviewEmptyView:(CGRect)frame AndRightBtnClickBlock:( void(^)())rightBlock;

//消息为空
+ (PromptView *)promptMessageEmptyView:(CGRect)frame AndRightBtnClickBlock:( void(^)())rightBlock;

//成功支付
+ (PromptView *)promptPaySuccessView:(CGRect)frame;

@end

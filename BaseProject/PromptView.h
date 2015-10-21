//
//  PromptView.h
//  BaseProject
//  view拓展类
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


- (instancetype) initWithFrame:(CGRect)frame AndTitleImage:(UIImage *)titleImage AndMainString:(NSString *)mainStr AndSubString:(NSString *)subString AndLeftButtonString:(NSString *)leftBtnStr AndRightButtonString:(NSString *)rightBtnStr;


@end

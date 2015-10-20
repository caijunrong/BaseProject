//
//  JRBarButtonItem.h
//  BaseProject
//
//  Created by caijunrong on 15/05/20.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JRNavItemStyle){
    
    JRNavItemStyleBack,//返回
    
    JRNavItemStyleCustom,//自定义
    
    JRNavItemStyleDone,//系统

};

@interface JRBarButtonItem : UIBarButtonItem

+ (instancetype)itemWithTitle:(NSString *)title
                  imageString:(NSString *)imageStr
                        style:(JRNavItemStyle)style
                       target:(id)target
                       action:(SEL)action;


@end

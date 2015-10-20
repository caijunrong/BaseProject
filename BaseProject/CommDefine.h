//
//  CommDefine.h
//  BaseProject
//
//  Created by caijunrong on 15/05/20.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface CommDefine : NSObject

#define getColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define BarColor getColor(228.0,58.0,61.0,1) //红色

#define lightRedColor getColor(254.0,146.0,155.0,1) //粉红色

#define KingColor getColor(248.0,147.0,38.0,1) //橘黄色

#define NavTextTintColor getColor(30.0,30.0,30.0,1) //灰色

//屏幕的宽高
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

//国际化
#undef L
#define L(key) \
[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]

@end

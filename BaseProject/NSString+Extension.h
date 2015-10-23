//
//  NSString+Extension.h
//  
//
//  Created by caijunrong on 14-4-2.
//  Copyright (c) 2014年 caijunrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize;

- (CGSize)sizeWithAttributeText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize andLineSpacing:(int)lineSpacing;

@end

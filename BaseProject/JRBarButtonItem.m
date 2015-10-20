//
//  JRBarButtonItem.m
//  BaseProject
//
//  Created by caijunrong on 15/05/20.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "JRBarButtonItem.h"

@implementation JRBarButtonItem

+ (instancetype)itemWithTitle:(NSString *)title imageString:(NSString *)imageStr style:(JRNavItemStyle)style target:(id)target action:(SEL)action{

    if (style == JRNavItemStyleBack) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn setImage:[UIImage imageNamed:@"link_houtui"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"link_houtui"] forState:UIControlStateHighlighted];
        [btn setFrame:CGRectMake(0, 0, 44, 44)];
        [btn setContentMode:UIViewContentModeScaleAspectFit];
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20) ;
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        JRBarButtonItem *item = [[JRBarButtonItem alloc] initWithCustomView:btn];
        return item;
        
    }else if(style == JRNavItemStyleCustom){
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundColor:[UIColor clearColor]];
        if (title) {
            [btn setTitle:title forState:UIControlStateNormal];
            [btn setTitle:title forState:UIControlStateHighlighted];
        }
        if (imageStr) {
            [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateHighlighted];
        }
        [btn setFrame:CGRectMake(0, 0, 44, 44)];
        [btn setContentMode:UIViewContentModeScaleAspectFit];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        JRBarButtonItem *item = [[JRBarButtonItem alloc] initWithCustomView:btn];
        return item;
    
    }else if (style == JRNavItemStyleDone){
        
        JRBarButtonItem *item = [[JRBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
//        item.tintColor = [UIColor darkGrayColor];
        return item;
        
    }else{
        
        return nil;
        
    }
    
    return nil;
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    
    if ([self.customView isKindOfClass:[UIControl class]])
    {
        UIControl *ctrl = (UIControl *)self.customView;
        ctrl.enabled = enabled;
    }
}



@end

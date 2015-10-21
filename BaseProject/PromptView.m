//
//  PromptView.m
//  BaseProject
//
//  Created by caijunrong on 15/05/21.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "PromptView.h"

@interface PromptView()

@property (nonatomic, strong) UIImageView   *titleImageView;  //图片

@property (nonatomic, strong) UILabel       *mainLabel;       //主标题

@property (nonatomic, strong) UILabel       *subLabel;        //副标题

@property (nonatomic, strong) UIButton      *leftButton;      //左边白色按钮

@property (nonatomic, strong) UIButton      *rightButton;     //右边主题颜色按钮

@end

@implementation PromptView

- (instancetype) initWithFrame:(CGRect)frame AndTitleImage:(UIImage *)titleImage AndMainString:(NSString *)mainStr AndSubString:(NSString *)subString AndLeftButtonString:(NSString *)leftBtnStr AndRightButtonString:(NSString *)rightBtnStr{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        CGFloat screen = (frame.size.width <= frame.size.height) ? frame.size.width : frame.size.height;
        
        CGFloat width = frame.size.width;
        
        CGFloat height = frame.size.height;
        
        CGFloat imageWidth = screen*2/5;
        
        CGFloat buttonTopMargin;
        
        //1.0
        [self.titleImageView setImage:titleImage];
        [self.titleImageView setFrame:CGRectMake((screen - imageWidth)/2, (height - imageWidth - 100)/2, imageWidth, imageWidth)];
        
        //2.0
        [self.mainLabel setText:mainStr];
        [self.mainLabel setFrame:CGRectMake(0, self.titleImageView.frame.size.height + self.titleImageView.frame.origin.y + 6, width, 28)];
        
        //3.0
        if (!subString || [subString isEqualToString:@""]) {
            
            buttonTopMargin = self.mainLabel.frame.size.height + self.mainLabel.frame.origin.y + 10;
            
        }else{
            
            [self.subLabel setText:subString];
            [self.subLabel setFrame:CGRectMake(0, self.mainLabel.frame.size.height + self.mainLabel.frame.origin.y + 8, width, 20)];
            
            buttonTopMargin = self.subLabel.frame.size.height + self.subLabel.frame.origin.y + 16;
        }
        
        
        //4.0
        
        float buttonWidth = 120;
        
        //4.0.1两边都有
        if ((leftBtnStr != nil && ![leftBtnStr isEqualToString:@""]) && (rightBtnStr != nil && ![rightBtnStr isEqualToString:@""])) {
            
            float buttonMargin = (width - buttonWidth*2)/3;
            
            [self.leftButton setTitle:leftBtnStr forState:UIControlStateNormal];
            [self.leftButton setFrame:CGRectMake(buttonMargin, buttonTopMargin, buttonWidth, 34)];
            
            [self.rightButton setTitle:rightBtnStr forState:UIControlStateNormal];
            [self.rightButton setFrame:CGRectMake(buttonMargin*2 + buttonWidth, buttonTopMargin, buttonWidth, 34)];
            
        //4.0.2只有左边都有
        }else if(leftBtnStr != nil && ![leftBtnStr isEqualToString:@""]){
            
            [self.leftButton setTitle:leftBtnStr forState:UIControlStateNormal];
            [self.leftButton setFrame:CGRectMake((width - buttonWidth)/2, buttonTopMargin, buttonWidth, 34)];
        
        //4.0.3只有右边有
        }else if(rightBtnStr != nil && ![rightBtnStr isEqualToString:@""]){
            
            [self.rightButton setTitle:rightBtnStr forState:UIControlStateNormal];
            [self.rightButton setFrame:CGRectMake((width - buttonWidth)/2, buttonTopMargin, buttonWidth, 34)];
        
        //两遍都没有
        }else{
        
        
        }
        
        
    }
    return self;
}

//成功支付
+ (PromptView *)promptPaySuccessView:(CGRect)frame{
    PromptView *promptV = [[super alloc]initWithFrame:frame AndTitleImage:[UIImage imageNamed:@"warnning_happy_pay"] AndMainString:@"成功支付订单" AndSubString:nil AndLeftButtonString:nil AndRightButtonString:nil];
    return promptV;
}

//消息为空
+ (PromptView *)promptMessageEmptyView:(CGRect)frame AndRightBtnClickBlock:( void(^)())rightBlock{
    PromptView *promptV = [[super alloc]initWithFrame:frame AndTitleImage:[UIImage imageNamed:@"warnning_message_empty"] AndMainString:@"暂无消息" AndSubString:nil AndLeftButtonString:nil AndRightButtonString:@"重试"];
    
    if (promptV) {
        [promptV setPromptRightBtnClickBlock:^{
            rightBlock();
        }];
    }
    return promptV;
}

//评论为空
+ (PromptView *)promptReviewEmptyView:(CGRect)frame RightBtnClickBlock:( void(^)())rightBlock{
    PromptView *promptV = [[super alloc]initWithFrame:frame AndTitleImage:[UIImage imageNamed:@"warnning_review_empty"] AndMainString:@"暂无评论" AndSubString:nil AndLeftButtonString:nil AndRightButtonString:@"重试"];
    
    if (promptV) {
        [promptV setPromptRightBtnClickBlock:^{
            rightBlock();
        }];
    }
    return promptV;
}

//商品为空
+ (PromptView *)promptGoodsEmptyView:(CGRect)frame{
    PromptView *promptV = [[super alloc]initWithFrame:frame AndTitleImage:[UIImage imageNamed:@"warnning_goods_empty"] AndMainString:@"什么东西都没有" AndSubString:nil AndLeftButtonString:nil AndRightButtonString:nil];
    return promptV;
}

//搜索为空
+ (PromptView *)promptSearchEmptyView:(CGRect)frame{
    PromptView *promptV = [[super alloc]initWithFrame:frame AndTitleImage:[UIImage imageNamed:@"warnning_search_empty"] AndMainString:@"找不到符合条件的商品" AndSubString:@"试试看其他关键词" AndLeftButtonString:nil AndRightButtonString:nil];
    return promptV;
}


//网络加载出错
+ (PromptView *)promptNetErrorView:(CGRect)frame RightBtnClickBlock:( void(^)())rightBlock{
    PromptView *promptV = [[super alloc]initWithFrame:frame AndTitleImage:[UIImage imageNamed:@"neterror"] AndMainString:@"数据加载失败" AndSubString:@"请确保您的手机已经联网" AndLeftButtonString:nil AndRightButtonString:@"重新加载"];
    
    if (promptV) {
        [promptV setPromptRightBtnClickBlock:^{
            rightBlock();
        }];
    }
    return promptV;
}


- (void)setPromptLeftBtnClickBlock:(void (^)())myBlocks{
    promptLeftBtnClick = [myBlocks copy];
}

- (void)setPromptRightBtnClickBlock:(void (^)())myBlocks{
    promptRightBtnClick = [myBlocks copy];
}

- (void)ButtonClick:(UIButton *)button{

    if (button.tag == 1) {
        //左边按钮
        if (promptLeftBtnClick) {
            promptLeftBtnClick();
        }
        
    }else if (button.tag == 2){
        //右边按钮
        if (promptRightBtnClick) {
            promptRightBtnClick();
        }
        
    }

}


//图片
- (UIImageView *)titleImageView{
    
    if (!_titleImageView) {
        
        _titleImageView = [[UIImageView alloc]init];
        [_titleImageView setContentMode:UIViewContentModeScaleAspectFit];
        
        [self addSubview:_titleImageView];
    }
    return _titleImageView;
}

//主标题
- (UILabel *)mainLabel{

    if (!_mainLabel) {
        
        _mainLabel = [[UILabel alloc]init];
        [_mainLabel setFont:[UIFont systemFontOfSize:WarnningTitleTextSize]];
        [_mainLabel setTextAlignment:NSTextAlignmentCenter];
        [_mainLabel setTextColor:[UIColor darkGrayColor]];
        
        [self addSubview:_mainLabel];
        
    }
    return _mainLabel;
}

//副标题
- (UILabel *)subLabel{
    
    if (!_subLabel) {
        
        _subLabel = [[UILabel alloc]init];
        [_subLabel setFont:[UIFont systemFontOfSize:WarnningSubTextSize]];
        [_subLabel setTextAlignment:NSTextAlignmentCenter];
        [_subLabel setTextColor:[UIColor lightGrayColor]];
        
        [self addSubview:_subLabel];
        
    }
    return _subLabel;
}

//白色按钮
- (UIButton *)leftButton{
    
    if (!_leftButton) {
        
        CGColorRef cgcolor = [UIColor groupTableViewBackgroundColor].CGColor;
        
        _leftButton = [[UIButton alloc]init];
        _leftButton.tag = 1;
        [_leftButton.layer setCornerRadius:CornerRadiusSize];
        [_leftButton.layer setBorderWidth:1.0f];
        [_leftButton.layer setBorderColor:cgcolor];
        [_leftButton.layer setMasksToBounds:YES];
        [_leftButton.titleLabel setFont:[UIFont systemFontOfSize:BigButtonTextSize]];
        [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_leftButton setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_leftButton];
    }
    return _leftButton;
}

//主题颜色按钮
- (UIButton *)rightButton{
    
    if (!_rightButton) {
        
        CGColorRef cgcolor = [UIColor groupTableViewBackgroundColor].CGColor;
        
        _rightButton = [[UIButton alloc]init];
        _rightButton.tag = 2;
        [_rightButton.layer setCornerRadius:CornerRadiusSize];
        [_rightButton.layer setBorderWidth:1.0f];
        [_rightButton.layer setBorderColor:cgcolor];
        [_rightButton.layer setMasksToBounds:YES];
        [_rightButton.titleLabel setFont:[UIFont systemFontOfSize:BigButtonTextSize]];
        [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_rightButton setBackgroundColor:TintColor];
        [self addSubview:_rightButton];
    }
    return _rightButton;
}




@end

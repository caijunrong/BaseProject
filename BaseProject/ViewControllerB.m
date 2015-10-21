//
//  ViewControllerB.m
//  BaseProject
//
//  Created by caijunrong on 15/05/20.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "ViewControllerB.h"
#import "PromptView.h"

@interface ViewControllerB ()

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNeedBackItem = YES;
    [self setNavTitle:@"第二个页面"];
    self.navigationItem.rightBarButtonItem = [self rightButtonItemWithTitle:nil orImageString:@"link_shuaxin"];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    
//    PromptView *prompt = [[PromptView alloc] initWithFrame:self.view.frame AndTitleImage:[UIImage imageNamed:@"warnning_review_empty"] AndMainString:@"暂无评论" AndSubString:@"要不抢个沙发，怎么样？"    AndLeftButtonString:@"__" AndRightButtonString:@"果断开抢"];
//    [self.view addSubview:prompt];
//    [prompt setPromptLeftBtnClickBlock:^{
//        NSLog(@"+++");
//    }];
//    
//    [prompt setPromptRightBtnClickBlock:^{
//        NSLog(@"===");
//    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

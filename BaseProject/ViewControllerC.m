//
//  ViewControllerC.m
//  BaseProject
//
//  Created by caijunrong on 15/05/20.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "ViewControllerC.h"

@interface ViewControllerC ()

@end

@implementation ViewControllerC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isNeedBackItem = YES;
    [self setNavTitle:@"第3个页面"];
    self.navigationItem.rightBarButtonItem = [self rightButtonItemWithTitle:nil orImageString:@"link_shuaxin"];
    [self.view setBackgroundColor:[UIColor purpleColor]];
    // Do any additional setup after loading the view.
    
    
    
    
    [self.view addSubview:self.promptNetErrorView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

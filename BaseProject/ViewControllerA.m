
//
//  ViewControllerA.m
//  BaseProject
//
//  Created by caijunrong on 15/05/20.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "ViewControllerA.h"
#import "ViewControllerB.h"

@interface ViewControllerA ()

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNeedBackItem = NO;
    self.canSwipeBack = NO;
    [self setNavTitle:@"第一个页面"];
    self.navigationItem.rightBarButtonItem = [self rightButtonItemWithTitle:nil orImageString:@"link_shuaxin"];
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)righBarClick{
    [super righBarClick];
    ViewControllerB *secondController = [[ViewControllerB alloc]init];
    secondController.isNeedBackItem = NO;
    [self.navigationController pushViewController:secondController animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

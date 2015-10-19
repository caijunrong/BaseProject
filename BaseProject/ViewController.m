//
//  ViewController.m
//  BaseProject
//
//  Created by caijunrong on 15/05/19.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "ViewController.h"

#import "CommonViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CommonViewController *comm = [[CommonViewController alloc]init];
    [self.view addSubview:comm.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

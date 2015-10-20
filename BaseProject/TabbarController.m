//
//  TabbarController.m
//  BaseProject
//
//  Created by caijunrong on 15/05/20.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "TabbarController.h"

#import "ViewControllerA.h"
#import "ViewControllerB.h"
#import "ViewControllerC.h"
#import "ViewControllerD.h"


@interface TabbarController ()

@end

@implementation TabbarController

- (id)init{
    
    self = [super init];
    
    if (self) {
        self.tabBar.tintColor = BarColor;
        
        UITabBarItem *item1 = [[UITabBarItem alloc] init];
        item1.tag = 1;
        [item1 setTitle:L(@"home")];
        [item1 setImage:[UIImage imageNamed:@"shouye_gray"]];
        [item1 setSelectedImage:[[UIImage imageNamed:@"shouye_red"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//        [item1 setTitleTextAttributes:@{UITextAttributeTextColor: BarColor}
//                             forState:UIControlStateSelected];

        
        UITabBarItem *item2 = [[UITabBarItem alloc] init];
        item2.tag = 2;
        [item2 setTitle:L(@"search")];
        [item2 setImage:[UIImage imageNamed:@"fenleisousuo_gray"]];
        [item2 setSelectedImage:[[UIImage imageNamed:@"fenleisousuo_red"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//        [item2 setTitleTextAttributes:@{UITextAttributeTextColor: BarColor}
//                             forState:UIControlStateSelected];

        
        UITabBarItem *item3 = [[UITabBarItem alloc] init];
        item3.tag = 3;
        [item3 setTitle:L(@"cart")];
        [item3 setImage:[UIImage imageNamed:@"gouwuche_gray"]];
        [item3 setSelectedImage:[[UIImage imageNamed:@"gouwuche_red"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//        [item3 setTitleTextAttributes:@{UITextAttributeTextColor: BarColor}
//                             forState:UIControlStateSelected];
        
        
        UITabBarItem *item4 = [[UITabBarItem alloc] init];
        item4.tag = 4;
        [item4 setTitle:L(@"my")];
        [item4 setImage:[UIImage imageNamed:@"wo_gray"]];
        [item4 setSelectedImage:[[UIImage imageNamed:@"wo_red"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//        [item4 setTitleTextAttributes:@{UITextAttributeTextColor:BarColor}
//                             forState:UIControlStateSelected];

        
        ViewControllerA *vA = [[ViewControllerA alloc]init];
        vA.tabBarItem = item1;
        UINavigationController *navigationViewControllerA = [[UINavigationController alloc]initWithRootViewController:vA];
        
        ViewControllerB *vB = [[ViewControllerB alloc]init];
        vB.tabBarItem = item2;
        UINavigationController *navigationViewControllerB = [[UINavigationController alloc]initWithRootViewController:vB];
        
        ViewControllerC *vC = [[ViewControllerC alloc]init];
        vC.tabBarItem = item3;
        UINavigationController *navigationViewControllerC = [[UINavigationController alloc]initWithRootViewController:vC];
        
        ViewControllerB *vD = [[ViewControllerB alloc]init];
        vD.tabBarItem = item4;
        UINavigationController *navigationViewControllerD = [[UINavigationController alloc]initWithRootViewController:vD];
        
        self.viewControllers = [NSArray arrayWithObjects:navigationViewControllerA,navigationViewControllerB,navigationViewControllerC,navigationViewControllerD, nil];
        
        self.tabBarController.delegate = self;
        
    }
    return self;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    return YES;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//有需要的话，可以做数据采集
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

}


@end

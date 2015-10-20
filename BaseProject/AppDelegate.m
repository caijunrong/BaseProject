//
//  AppDelegate.m
//  BaseProject
//
//  Created by caijunrong on 15/05/19.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "AppDelegate.h"
#import "APIUtil.h"

@interface AppDelegate ()

@property (nonatomic, strong) APIUtil *apiUtil;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //初始化API
    [self initAPI];
    
    //初始化window
    self.window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    _tabbarController = [[TabbarController alloc]init];
    
    self.window.rootViewController = _tabbarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

/*
 *  防止因为IP地址不可用，而导致整个APP都无法访问网络的情况存在
 */
- (void)initAPI{
    
    _apiUtil = [APIUtil sharedInstance];
    
    NSArray *api = [NSArray arrayWithObjects:@"mws.biyabi.com",@"mws1.biyabi.com",@"211.151.52.185:8089", nil];
    NSArray *soApi = [NSArray arrayWithObjects:@"211.151.52.203:8088",@"211.151.52.202:8088",nil];
    
    [_apiUtil initApiWithArray:api];
    [_apiUtil initSearchApiWithArray:soApi];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

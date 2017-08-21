//
//  AppDelegate.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/17.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "AppDelegate.h"
#import "PaintMainController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //初始化一个tabBar控制器
    UITabBarController *tb = [UITabBarController new];
    //设置控制器为Window的根控制器
    self.window.rootViewController = tb;
    
    //创建子控制器
    PaintMainController *c1 = [PaintMainController new];
    c1.view.backgroundColor = randomColor();
    c1.title = @"质感涂料";
    c1.tabBarItem.image = [UIImage imageNamed:@"item_paint"];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:c1];
    nav1.navigationBar.translucent = NO;
    
    //创建子控制器
    UIViewController *c2 = [UIViewController new];
    c2.view.backgroundColor = randomColor();
    c2.title = @"收藏";
    c2.tabBarItem.image = [UIImage imageNamed:@"item_collection"];
    
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:c2];
    nav2.navigationBar.translucent = NO;
    
    tb.viewControllers = @[nav1, nav2];
    tb.tabBar.translucent = NO;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

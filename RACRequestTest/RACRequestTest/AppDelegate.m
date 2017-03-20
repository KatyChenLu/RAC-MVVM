//
//  AppDelegate.m
//  RACRequestTest
//
//  Created by 陈璐 on 2017/3/6.
//  Copyright © 2017年 Chenlu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "LoginViewController.h"
#import "ZIKConstraintsGuard.h"
#import "tabTestViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    tabVC.view.backgroundColor = [UIColor whiteColor];
    
    ViewController *oneVC = [[ViewController alloc]init];
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    LoginViewController *twoVC = [story instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    tabTestViewController *thireVC = [[tabTestViewController alloc] init];
    
    
    oneVC.title = @"request";
    twoVC.title = @"login";
    thireVC.title = @"table";

    
    //test1
    
    //test1 第二次
    


    
    UINavigationController *navC1 = [[UINavigationController alloc] initWithRootViewController:oneVC];
    UINavigationController *navC2 = [[UINavigationController alloc] initWithRootViewController:twoVC];
    
    
    
    tabVC.viewControllers        = @[navC2, navC1];
    
    self.window.rootViewController = tabVC;
    //monitor constraint conflict
    [ZIKConstraintsGuard monitorUnsatisfiableConstraintWithHandler:^(UIView *view,
                                                                     UIViewController *viewController,
                                                                     NSLayoutConstraint *constraintToBreak,
                                                                     NSArray<NSLayoutConstraint *> *currentConstraints,
                                                                     NSString *description) {
        
        NSLog(@"检测到约束冲突！");
        NSString *className = NSStringFromClass([viewController class]);
        if ([className hasPrefix:@"UI"] && ![className isEqualToString:@"UIApplication"]) {
            //使用某些系统控件时会出现约束冲突，例如UIAlertController
            NSLog(@"ignore conflict in UIKit:%@",viewController);
            return;
        }
        NSLog(@"冲突所在的viewController:\n%@ \nview:\n%@",viewController,view);
        //使用recursiveDescription来打印view的层级，注意这是private API
        NSLog(@"view hierarchy:\n%@",[view valueForKeyPath:@"recursiveDescription"]);
        NSLog(@"目前所有的约束:\n%@",currentConstraints);
        NSLog(@"系统尝试打破的约束:\n%@",constraintToBreak);
    }];
    
 
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

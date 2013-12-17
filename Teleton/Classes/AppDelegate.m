//
//  AppDelegate.m
//  Teleton
//
//  Created by Javi on 10/24/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "AppDelegate.h"
#import "NavigationController.h"
#import "HomeViewController.h"
#import "DonateController.h"
#import "Styles.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.95];
    self.navigationController = [[NavigationController alloc] initWithRootViewController:[HomeViewController new]];
    self.window.rootViewController = self.navigationController;

    // Status and Navigation bar
    if ([UIDevice currentDevice].allowsiOS7Style) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        [[UINavigationBar appearance] setBarTintColor:[[UIColor whiteColor] colorWithAlphaComponent:1.00]];
        [[UINavigationBar appearance] setTintColor:[Styles instance].redColor];
        [[UIToolbar appearance] setBarTintColor:[[UIColor whiteColor] colorWithAlphaComponent:1.00]];
        [[UIToolbar appearance] setTintColor:[Styles instance].redColor];
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
        [[UINavigationBar appearance] setTintColor:[Styles instance].redColor];
        [[UIToolbar appearance] setTintColor:[Styles instance].redColor];
    }

    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    if ([self.navigationController.topViewController isKindOfClass:DonateController.class]) {
        DonateController *vc = (DonateController *)self.navigationController.topViewController;
        [vc refreshViews];
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end

//
//  Styles.m
//  Teleton
//
//  Created by Javi on 10/29/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "Styles.h"

@implementation Styles

+ (Styles *)instance
{
    static Styles *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Styles new];
        
        
        sharedInstance.pinkColor = [UIColor colorWithRed:1.0000 green:0.6078 blue:0.6157 alpha:1.0];
        sharedInstance.redColor = [UIColor colorWithRed:0.6000 green:0.0157 blue:0.0549 alpha:1.0];
        sharedInstance.orangeColor = [UIColor colorWithRed:0.9804 green:0.3255 blue:0.1412 alpha:1.0];
        sharedInstance.greenColor = [UIColor colorWithRed:0.4667 green:0.7569 blue:0.2392 alpha:1.0];
        sharedInstance.lightBlueColor = [UIColor colorWithRed:0.1412 green:0.6667 blue:0.9216 alpha:1.0];
        
        sharedInstance.teletonPrimaryColor = [UIColor colorWithRed:231.0/255.0
                                                             green:0.0/255.0
                                                              blue:51.0/255.0
                                                             alpha:1.0];
        sharedInstance.teletonSecondaryColor = [UIColor colorWithRed:115.0/255.0
                                                             green:115.0/255.0
                                                              blue:115.0/255.0
                                                             alpha:1.0];
        sharedInstance.primaryTextColor = [UIColor colorWithRed:255.0/255.0
                                                             green:255.0/255.0
                                                              blue:255.0/255.0
                                                             alpha:1.0];
        sharedInstance.secondaryTextColor = [UIColor colorWithRed:255.0/255.0
                                                             green:25.0/255.0
                                                              blue:76.0/255.0
                                                             alpha:1.0];
        sharedInstance.teletonButtonNormalColor = [UIColor colorWithRed:0.0/255.0
                                                             green:154.0/255.0
                                                              blue:24.0/255.0
                                                             alpha:1.0];
        sharedInstance.teletonButtonSelectionColor = [UIColor colorWithRed:154.0/255.0
                                                             green:0.0/255.0
                                                              blue:34.0/255.0
                                                             alpha:1.0];
        sharedInstance.teletonButtonHighlightedColor = [UIColor colorWithRed:0.0/255.0
                                                             green:231.0/255.0
                                                              blue:37.0/255.0
                                                             alpha:1.0];
    });
    return sharedInstance;
}

- (void)applyStyleOnNavigationBar:(UINavigationBar *)navigationBar
{
    UIColor *color = [UIColor colorWithRed:134/255.0 green:5/255.0 blue:12/255.0 alpha:0.8];
    if ([navigationBar respondsToSelector:@selector(setBarTintColor:)]) {
        navigationBar.barTintColor = color;
        navigationBar.tintColor = [UIColor redColor];
        navigationBar.translucent = YES;
    } else {
        navigationBar.tintColor = color;
    }
}

- (void)applyStyleOnToolbar:(UIToolbar *)toolbar
{
    UIColor *color = [UIColor colorWithRed:134/255.0 green:5/255.0 blue:12/255.0 alpha:0.8];
    if ([toolbar respondsToSelector:@selector(setBarTintColor:)]) {
        toolbar.barTintColor = color;
        toolbar.tintColor = [UIColor whiteColor];
        toolbar.translucent = YES;
    } else {
        toolbar.tintColor = color;
    }
}

@end

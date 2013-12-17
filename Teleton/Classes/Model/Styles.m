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
    });
    return sharedInstance;
}

@end

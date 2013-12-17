//
//  UIDevice+Info.m
//  Teleton
//
//  Created by Javi on 11/2/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "UIDevice+Info.h"

@implementation UIDevice (Info)

- (BOOL)allowsiOS7Style
{
    NSNumber *version = @([[[UIDevice currentDevice] systemVersion] floatValue]);
    return version.floatValue >= 7;
}

@end

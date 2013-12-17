//
//  TeletonAlertView.m
//  Teleton
//
//  Created by Javi on 11/6/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "TeletonAlertView.h"

@implementation TeletonAlertView

+ (id)alertViewWithDelegate:(id<UIAlertViewDelegate>)delegate message:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Teletón 2013"
                                                        message:message
                                                       delegate:delegate
                                              cancelButtonTitle:@"Aceptar"
                                              otherButtonTitles:nil];
    return alertView;
}

@end

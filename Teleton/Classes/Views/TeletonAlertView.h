//
//  TeletonAlertView.h
//  Teleton
//
//  Created by Javi on 11/6/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeletonAlertView : UIAlertView

+ (id)alertViewWithDelegate:(id<UIAlertViewDelegate>)delegate message:(NSString *)message;

@end

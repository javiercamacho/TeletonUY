//
//  Styles.h
//  Teleton
//
//  Created by Javi on 10/29/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Styles : NSObject

@property (nonatomic, strong) UIColor *pinkColor;
@property (nonatomic, strong) UIColor *redColor;
@property (nonatomic, strong) UIColor *orangeColor;
@property (nonatomic, strong) UIColor *greenColor;
@property (nonatomic, strong) UIColor *lightBlueColor;






@property (nonatomic, strong) UIColor *teletonPrimaryColor;
@property (nonatomic, strong) UIColor *teletonSecondaryColor;
@property (nonatomic, strong) UIColor *primaryTextColor;
@property (nonatomic, strong) UIColor *secondaryTextColor;
@property (nonatomic, strong) UIColor *teletonButtonSelectionColor;
@property (nonatomic, strong) UIColor *teletonButtonHighlightedColor;
@property (nonatomic, strong) UIColor *teletonButtonNormalColor;

+ (Styles *)instance;

- (void)applyStyleOnNavigationBar:(UINavigationBar *)navigationBar;
- (void)applyStyleOnToolbar:(UIToolbar *)toolbar;

@end
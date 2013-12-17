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

+ (Styles *)instance;

@end
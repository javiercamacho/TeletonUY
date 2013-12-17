//
//  UIImage+Styles.h
//  Teleton
//
//  Created by Javi on 10/27/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Styles)

+ (UIImage *)createCroppedImageFromView:(UIView *)view cropRect:(CGRect)rect;
+ (UIImage *)createCroppedImageFromView:(UIView *)v radius:(CGFloat)r tintColor:(UIColor *)c cropRect:(CGRect)rect;

@end

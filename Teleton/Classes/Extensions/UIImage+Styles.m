//
//  UIImage+Styles.m
//  Teleton
//
//  Created by Javi on 10/27/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "UIImage+Styles.h"
#import "UIImage+ImageEffects.h"

@implementation UIImage (Styles)

+ (UIImage *)createCroppedImageFromView:(UIView *)v radius:(CGFloat)r tintColor:(UIColor *)c cropRect:(CGRect)rect
{
    UIGraphicsBeginImageContextWithOptions(v.size, NO, [UIScreen mainScreen].scale);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGImageRef crop = CGImageCreateWithImageInRect(screenShot.CGImage, rect);
    UIImage *croppedImage = [[UIImage imageWithCGImage:crop] applyBlurWithRadius:r
                                                                       tintColor:c
                                                           saturationDeltaFactor:1.0
                                                                       maskImage:nil];
    return croppedImage;
}

+ (UIImage *)createCroppedImageFromView:(UIView *)view cropRect:(CGRect)rect
{
    return [self createCroppedImageFromView:view radius:20.0 tintColor:[[UIColor whiteColor]
                                                                        colorWithAlphaComponent:0.8] cropRect:rect];
}

@end

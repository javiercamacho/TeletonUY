//
//  TransparentButton.m
//  Teleton
//
//  Created by Javi on 10/27/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "TransparentButton.h"
#import "UIImage+ImageEffects.h"

@interface TransparentButton ()

@property (nonatomic, strong) UIImage *backgroundImage;

@end

@implementation TransparentButton

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.layer.cornerRadius = 5;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 1.0;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

    if ([UIDevice currentDevice].allowsiOS7Style) {
        UIColor *tintColor = [UIColor clearColor];
        self.backgroundImage = [UIImage createCroppedImageFromView:self.superview
                                                          radius:3.0
                                                       tintColor:tintColor
                                                        cropRect:self.frame];
    }
}

- (void)setHighlighted:(BOOL)highlighted
{
    if ([UIDevice currentDevice].allowsiOS7Style) {
        [self.backgroundImage applyBlurWithRadius:3.0 tintColor: (highlighted) ? [UIColor blackColor] : [UIColor clearColor]
                            saturationDeltaFactor:5.0 maskImage:nil];
        self.backgroundColor = [UIColor colorWithPatternImage:self.backgroundImage];
    } else {
        [super setHighlighted:highlighted];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    UIColor *tintColor = (self.highlighted) ? [UIColor colorWithRed:255/255.0
                                                         green:252.0/255.0
                                                          blue:137/255.0
                                                         alpha:0.2] : [UIColor clearColor];
    UIImage *tintImage = [UIImage createCroppedImageFromView:self.parentView
                                                      radius:(self.highlighted) ? 2.0 : 1.0
                                                   tintColor:tintColor
                                                    cropRect:self.frame];
    self.backgroundColor = [UIColor colorWithPatternImage:tintImage];
}
@end

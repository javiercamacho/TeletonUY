//
//  OtherWaysController.m
//  Teleton
//
//  Created by Matias Gelos on 11/14/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "PhonesController.h"

@interface PhonesController ()

@property (nonatomic, weak) IBOutlet UILabel *phonesTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *phonesLabel;
@property (nonatomic, weak) IBOutlet UILabel *bitsTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *bitsLabel;

@end

@implementation PhonesController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Por teléfono";
    
    self.phonesTitleLabel.font = [UIFont fontWithName:@"VAG-Rounded-Bold" size:16];
    self.bitsTitleLabel.font = [UIFont fontWithName:@"VAG-Rounded-Bold" size:16];
    self.bitsLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    
    NSMutableAttributedString *phoneString = [[NSMutableAttributedString alloc] initWithString:self.phonesLabel.text];

    [phoneString addAttribute:NSForegroundColorAttributeName
                        value:[UIColor whiteColor]
                        range:NSMakeRange(0, self.phonesLabel.text.length)];
    [phoneString addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"Helvetica" size:14]
                        range:NSMakeRange(0, self.phonesLabel.text.length)];

    [phoneString addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"VAG-Rounded-Bold" size:18]
                        range:NSMakeRange(2, 10)];
    [phoneString addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"VAG-Rounded-Bold" size:18]
                        range:NSMakeRange(36, 10)];
    [phoneString addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"VAG-Rounded-Bold" size:18]
                        range:NSMakeRange(70, 10)];
    [phoneString addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"VAG-Rounded-Bold" size:18]
                        range:NSMakeRange(104, 10)];
    [phoneString addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"VAG-Rounded-Bold" size:18]
                        range:NSMakeRange(139, 10)];
    [phoneString addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"VAG-Rounded-Bold" size:18]
                        range:NSMakeRange(174, 10)];

    [phoneString addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"VAG-Rounded-Bold" size:18]
                        range:NSMakeRange(22, 2)];
    [phoneString addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"VAG-Rounded-Bold" size:18]
                        range:NSMakeRange(56, 2)];
    [phoneString addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"VAG-Rounded-Bold" size:18]
                        range:NSMakeRange(90, 2)];
    [phoneString addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"VAG-Rounded-Bold" size:18]
                        range:NSMakeRange(124, 3)];
    [phoneString addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"VAG-Rounded-Bold" size:18]
                        range:NSMakeRange(159, 3)];
    [phoneString addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"VAG-Rounded-Bold" size:18]
                        range:NSMakeRange(194, 3)];

    self.phonesLabel.attributedText = phoneString;
}


#pragma mark - Rotation Handling
- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

@end

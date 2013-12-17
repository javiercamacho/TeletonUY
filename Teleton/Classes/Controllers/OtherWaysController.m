//
//  OtherWaysController.m
//  Teleton
//
//  Created by Matias Gelos on 11/12/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "OtherWaysController.h"

@interface OtherWaysController ()

@property (nonatomic, weak) IBOutlet UILabel *bankTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *bankLabel;
@property (nonatomic, weak) IBOutlet UILabel *abitabTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *abitabLabel;
@property (nonatomic, weak) IBOutlet UILabel *infoTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *infoLabel;

@end

@implementation OtherWaysController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Otras vías";
    
    self.bankTitleLabel.font = [UIFont fontWithName:@"VAG-Rounded-Bold" size:16];
    self.bankLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    self.abitabTitleLabel.font = [UIFont fontWithName:@"VAG-Rounded-Bold" size:16];
    self.abitabLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    self.infoTitleLabel.font = [UIFont fontWithName:@"VAG-Rounded-Bold" size:16];
    self.infoLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
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

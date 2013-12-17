//
//  InfoHeaderView.m
//  Teleton
//
//  Created by Javi on 11/13/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "InfoHeaderView.h"
#import "TeletonDoubleLabel.h"

@interface InfoHeaderView () <TeletonDoubleLabelDelegate>

@property (nonatomic, weak) IBOutlet TeletonDoubleLabel *phoneLabel;
@property (nonatomic, weak) IBOutlet TeletonDoubleLabel *mailLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet TeletonDoubleLabel *nameLabel;

@end

@implementation InfoHeaderView

- (void)awakeFromNib
{
    [super awakeFromNib];

    self.titleLabel.font = [UIFont fontWithName:@"VAG-Rounded-Bold" size:18];
}

- (void)load
{
    self.phoneLabel.delegate = self;
    self.phoneLabel.title = @"Tel:";
    self.phoneLabel.value = @"2304 3620";
    self.mailLabel.delegate = self;
    self.mailLabel.title = @"Mail:";
    self.mailLabel.value = @"comunicacion@teleton.org.uy";
}

#pragma mark - TeletonDoubleLabelDelegate
- (void)teletonDoubleLabelValueTapped:(TeletonDoubleLabel *)label
{
    if ([label isEqual:self.phoneLabel]) {
        [self.delegate callPhone:@"23043620"];
    } else {
        [self.delegate sendEmail:@"comunicacion@teleton.org.uy"];
    }
}

@end

//
//  ContactInfoCell.m
//  Teleton
//
//  Created by Javi on 11/6/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "ContactInfoCell.h"
#import "TeletonDoubleLabel.h"

@interface ContactInfoCell () <TeletonDoubleLabelDelegate>

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet TeletonDoubleLabel *phoneLabel;
@property (nonatomic, weak) IBOutlet TeletonDoubleLabel *cellphoneLabel;
@property (nonatomic, weak) IBOutlet TeletonDoubleLabel *mailLabel;
@property (nonatomic, weak) IBOutlet TeletonDoubleLabel *secondMailLabel;
@property (nonatomic, strong) NSArray *contactLabels;

@end

@implementation ContactInfoCell

- (void)dealloc
{
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(contact))];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self addObserver:self forKeyPath:NSStringFromSelector(@selector(contact)) options:0 context:nil];

    self.phoneLabel.delegate = self;
    self.cellphoneLabel.delegate = self;
    self.mailLabel.delegate = self;
    self.secondMailLabel.delegate = self;
    
    self.titleLabel.font = [UIFont fontWithName:@"VAG-Rounded-Bold" size:18];
    self.nameLabel.font = [UIFont fontWithName:@"VAG-Rounded-Bold" size:16];
    
    self.contactLabels = @[self.phoneLabel, self.cellphoneLabel, self.mailLabel, self.secondMailLabel];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    self.titleLabel.text = self.contact.title;
    self.nameLabel.text = self.contact.name;
    
    self.phoneLabel.title = @"Tel:";
    self.cellphoneLabel.title = @"Cel:";
    self.mailLabel.title = @"Mail:";

    self.phoneLabel.value = self.contact.phoneText;
    self.cellphoneLabel.value = self.contact.cellphoneText;
    self.mailLabel.value = self.contact.mail;
    self.secondMailLabel.value = self.contact.secondMail;
    
    CGFloat top = self.nameLabel.bottom;
    for (TeletonDoubleLabel *lbl in self.contactLabels) {
        if (!lbl.hidden) {
            lbl.top = top;
            top += 20;
        }
    }
}

#pragma mark - TeletonDoubleLabelDelegate
- (void)teletonDoubleLabelValueTapped:(TeletonDoubleLabel *)label
{
    if ([label isEqual:self.phoneLabel]) {
        [self.delegate callPhone:self.contact.phone];
    } else if ([label isEqual:self.cellphoneLabel]) {
        [self.delegate callPhone:self.contact.cellphone];
    } else if ([label isEqual:self.mailLabel]) {
        [self.delegate sendEmail:self.contact.mail];
    }
}

@end

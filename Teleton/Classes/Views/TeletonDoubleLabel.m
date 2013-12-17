//
//  TeletonDoubleLabel.m
//  Teleton
//
//  Created by Javi on 11/7/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "TeletonDoubleLabel.h"

@interface TeletonDoubleLabel ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *valueLabel;

@end

@implementation TeletonDoubleLabel

- (void)dealloc
{
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(title))];
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(value))];
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(titleWidth))];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(titleWidth))]) {
        self.titleLabel.width = self.titleWidth;
        self.valueLabel.left = self.titleLabel.right;
        self.valueLabel.width = self.width - self.valueLabel.left;
    } else if ([keyPath isEqualToString:NSStringFromSelector(@selector(title))]) {
        self.titleLabel.text = self.title;
    } else {
        if (self.value) {
            NSMutableAttributedString *valueAtt = [[NSMutableAttributedString alloc] initWithString:self.value];
            [valueAtt addAttribute:NSUnderlineStyleAttributeName value:@(1) range:NSMakeRange(0, self.value.length)];
            self.valueLabel.attributedText = [valueAtt copy];            
        }
        self.hidden = (self.value == nil) || (self.value.length == 0);
    }
}

#pragma mark - Private
- (void)setup
{
    self.titleWidth = 40;
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.titleWidth, self.height)];
    self.titleLabel.font = [UIFont fontWithName:@"VAG-Rounded-Bold" size:14];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.titleLabel];
    
    self.valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleWidth, 0,
                                                                self.width - self.titleWidth, self.height)];//
    self.valueLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    self.valueLabel.textColor = [UIColor whiteColor];
    self.valueLabel.backgroundColor = [UIColor clearColor];
    self.valueLabel.userInteractionEnabled = YES;
    [self.valueLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(valueLabelTapped)]];
    [self addSubview:self.valueLabel];
    
    [self addObserver:self forKeyPath:NSStringFromSelector(@selector(title)) options:0 context:nil];
    [self addObserver:self forKeyPath:NSStringFromSelector(@selector(value)) options:0 context:nil];
    [self addObserver:self forKeyPath:NSStringFromSelector(@selector(titleWidth)) options:0 context:nil];
}

- (void)valueLabelTapped
{
    [self.delegate teletonDoubleLabelValueTapped:self];
}

@end

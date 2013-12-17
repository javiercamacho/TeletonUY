//
//  CountdownView.m
//  Teleton
//
//  Created by Javi on 10/29/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "CountdownView.h"

@interface CountdownView ()

@property (nonatomic, strong) NSMutableArray *digitLabels;

@end

@implementation CountdownView

- (id)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.digitLabels = [NSMutableArray new];
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 5;
        self.layer.borderColor = [UIColor clearColor].CGColor;
        self.layer.borderWidth = 1.5;

    }
    return self;
}

- (void)displayAmount:(NSInteger)amount
{
    [self.digitLabels removeAllObjects];
    
    NSNumberFormatter *nf = [NSNumberFormatter new];
    nf.numberStyle = NSNumberFormatterDecimalStyle;
    nf.decimalSeparator = @",";
    nf.groupingSeparator = @".";
    nf.maximumFractionDigits = 0;
    NSString *stringAmount = [nf stringFromNumber:@(amount)];

    NSInteger index = stringAmount.length - 1;
    do {
        NSString *digit = [stringAmount substringWithRange:NSMakeRange(index, 1)];
        index--;
        UIView *digitView = [self createDigitLabelWithString:digit];
        [self insertSubview:digitView atIndex:0];
    } while (index >= 0);
    UIView *currencyView = [self createDigitLabelWithString:@"$"];
    [self insertSubview:currencyView atIndex:0];
    
    CGFloat left = 0;
    for (UIView *s in self.subviews) {
        s.left = left;
        left += s.width;
    }
    self.size = CGSizeMake(left+1, 40);
}

- (UIView *)createDigitLabelWithString:(NSString *)digitString
{
    UILabel *digitLabel = [UILabel new];
    digitLabel.size = CGSizeMake(22, 40);
    digitLabel.backgroundColor = [UIColor clearColor];
    digitLabel.layer.borderColor = [UIColor blackColor].CGColor;
    digitLabel.layer.borderWidth = 0;
    digitLabel.layer.cornerRadius = 3;
    digitLabel.font = [UIFont boldSystemFontOfSize:28];
    digitLabel.textAlignment = NSTextAlignmentCenter;
    digitLabel.textColor = [UIColor whiteColor];
    digitLabel.text = digitString;
    if ([digitLabel.text isEqualToString:@"."]) {
        digitLabel.width = 8;
    }
    return digitLabel;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

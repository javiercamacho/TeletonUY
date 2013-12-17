//
//  TeletonDoubleLabel.h
//  Teleton
//
//  Created by Javi on 11/7/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TeletonDoubleLabel;
@protocol TeletonDoubleLabelDelegate <NSObject>

- (void)teletonDoubleLabelValueTapped:(TeletonDoubleLabel *)label;

@end

@interface TeletonDoubleLabel : UIView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, assign) CGFloat titleWidth;
@property (nonatomic, weak) id<TeletonDoubleLabelDelegate> delegate;

@end

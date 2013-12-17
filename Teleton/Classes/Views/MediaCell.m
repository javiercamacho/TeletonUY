//
//  MediaCell.m
//  Teleton
//
//  Created by Javi on 11/2/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "MediaCell.h"

@interface MediaCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation MediaCell

- (void)dealloc
{
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(displayStyle))];
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(image))];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];

        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(2, 2, self.width - 4, self.height - 4)];
        self.imageView.clipsToBounds = YES;
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.imageView];
        
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(displayStyle)) options:0 context:nil];
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(image)) options:0 context:nil];
        
        self.displayStyle = PhotoItemStyle_Plain;
        
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(displayStyle))]) {
        self.imageView.frame = CGRectMake(2, 2, self.width - 4, self.height - 4);
        self.backgroundColor = (self.displayStyle == PhotoItemStyle_Plain) ? [UIColor clearColor] : [UIColor whiteColor];
    } else if ([keyPath isEqualToString:NSStringFromSelector(@selector(image))]) {
        self.imageView.image = self.image;
    }
}


@end

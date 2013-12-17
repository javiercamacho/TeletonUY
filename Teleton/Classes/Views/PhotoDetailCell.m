//
//  PhotoDetailCell.m
//  Teleton
//
//  Created by Javi on 11/9/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "PhotoDetailCell.h"

@interface PhotoDetailCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation PhotoDetailCell

- (void)dealloc
{
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(image))];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.imageView.backgroundColor = [UIColor blackColor];
        [self addSubview:self.imageView];
        
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(image)) options:0 context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    self.imageView.image = self.image;
}

@end

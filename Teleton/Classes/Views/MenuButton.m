//
//  MenuButton.m
//  Teleton
//
//  Created by Javi on 10/29/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "MenuButton.h"

@implementation MenuButton

- (void)setHighlighted:(BOOL)highlighted
{
    self.alpha = (highlighted) ? 0.8 :1.0;
    self.backgroundColor = (highlighted) ? [UIColor clearColor] : [UIColor whiteColor];
}

@end

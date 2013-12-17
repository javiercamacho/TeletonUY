//
//  BounceAnimationController.h
//  Teleton
//
//  Created by Javi on 10/31/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    BounceDirection_Up,
    BounceDirection_Down,
    BounceDirection_Left,
    BounceDirection_Right,
} BounceDirection;

@interface BounceAnimationController : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BounceDirection direction;

@end

//
//  BounceAnimationController.m
//  Teleton
//
//  Created by Javi on 10/31/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "BounceAnimationController.h"

@implementation BounceAnimationController

- (id)init
{
    self = [super init];
    if (self) {
        self.direction = BounceDirection_Up;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    
    UIView *containerView = [transitionContext containerView];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    switch (self.direction) {
        case BounceDirection_Up: toVC.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height); break;
        case BounceDirection_Down: toVC.view.frame = CGRectOffset(finalFrame, 0, -screenBounds.size.height); break;
        case BounceDirection_Left: toVC.view.frame = CGRectOffset(finalFrame, screenBounds.size.width, 0); break;
        case BounceDirection_Right: toVC.view.frame = CGRectOffset(finalFrame, -screenBounds.size.width, 0); break;
        default: break;
    }
    
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         fromVC.view.alpha = 0.5;
                         toVC.view.frame = finalFrame;
                     } completion:^(BOOL finished) {
                         fromVC.view.alpha = 1.0;
                         [transitionContext completeTransition:YES];
                     }];
}

@end

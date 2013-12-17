//
//  ShrinkAnimationController.m
//  Teleton
//
//  Created by Javi on 10/31/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "ShrinkAnimationController.h"

@implementation ShrinkAnimationController

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.7;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toViewController];
    
    UIView *containerView = [transitionContext containerView];
    
    toViewController.view.frame = finalFrame;
    toViewController.view.alpha = 0.5;
    
    [containerView addSubview:toViewController.view];
    [containerView sendSubviewToBack:toViewController.view];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect shrunkenFrame = CGRectInset(fromViewController.view.frame, fromViewController.view.frame.size.width/4, fromViewController.view.frame.size.height/4);
    CGRect fromFinalFrame = CGRectOffset(shrunkenFrame, 0, screenBounds.size.height);
    
    UIView *intermediateView = [fromViewController.view snapshotViewAfterScreenUpdates:NO];
    intermediateView.frame = fromViewController.view.frame;
    [containerView addSubview:intermediateView];
    
    [fromViewController.view removeFromSuperview];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateKeyframesWithDuration:duration
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeCubic
                              animations:^{
                                  [UIView addKeyframeWithRelativeStartTime:0.0
                                                          relativeDuration:0.5
                                                                animations:^{
                                                                    intermediateView.frame = shrunkenFrame;
                                                                    toViewController.view.alpha = 0.5;
                                                                }];
                                  [UIView addKeyframeWithRelativeStartTime:0.5
                                                          relativeDuration:0.5
                                                                animations:^{
                                                                    intermediateView.frame = fromFinalFrame;
                                                                    toViewController.view.alpha = 1.0;
                                                                }];
                              }
                              completion:^(BOOL finished) {
                                  [intermediateView removeFromSuperview];
                                  [transitionContext completeTransition:YES];
                              }];
}

@end

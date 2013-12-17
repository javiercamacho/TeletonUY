//
//  BaseViewController.m
//  Teleton
//
//  Created by Javi on 10/31/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "BaseViewController.h"
#import "SharingViewController.h"
#import "BounceAnimationController.h"
#import "ShrinkAnimationController.h"

@interface BaseViewController ()

@property (nonatomic, strong) BounceAnimationController *bounceAnimationController;
@property (nonatomic, strong) ShrinkAnimationController *shrinkAnimationController;

@end

@implementation BaseViewController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.bounceAnimationController = [BounceAnimationController new];
        self.shrinkAnimationController = [ShrinkAnimationController new];
    }
    return self;
}

#pragma mark - Overrides

- (void)setTitle:(NSString *)title
{
    // Navigation Title
    self.navigationItem.titleView = nil;
    UILabel *lbl = [UILabel new];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.textColor = [UIDevice currentDevice].allowsiOS7Style ? [Styles instance].redColor : [UIColor whiteColor];
    lbl.font = [UIFont systemFontOfSize:18];
    lbl.text = title;
    [lbl sizeToFit];
    self.navigationItem.titleView = lbl;
    
    // Title for Back Button
    self.navigationItem.title = title;
}

#pragma mark - Actions
- (IBAction)share:(id)sender
{
    SharingViewController *controller = [SharingViewController new];
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    return self.bounceAnimationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.shrinkAnimationController;
}

@end

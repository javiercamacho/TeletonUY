//
//  BaseViewController.h
//  Teleton
//
//  Created by Javi on 10/31/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import <UIKit/UIKit.h>

#define is4InchDisplay  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE

@interface BaseViewController : UIViewController <UINavigationControllerDelegate, UIViewControllerTransitioningDelegate>

@property (nonatomic, weak) IBOutlet UIToolbar *toolbar;

- (IBAction)share:(id)sender;

@end

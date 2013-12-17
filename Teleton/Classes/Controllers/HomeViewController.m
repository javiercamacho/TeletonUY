//
//  HomeViewController.m
//  Teleton
//
//  Created by Javi on 10/24/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "HomeViewController.h"
#import "MediaListController.h"
#import "DonateController.h"
#import "InfoViewController.h"
#import "TeletonViewController.h"
#import "CountdownView.h"
#import "Facade.h"
#import "MenuButton.h"
#import "BounceAnimationController.h"
#import "ShrinkAnimationController.h"
#import "HomeButton.h"

@interface HomeViewController () <UINavigationControllerDelegate>

@property (nonatomic, strong) BounceAnimationController *bounceAnimationController;

@property (nonatomic, weak) IBOutlet UIView *amountContainer;
@property (nonatomic, weak) IBOutlet UILabel *daysLabel;
@property (nonatomic, weak) IBOutlet UILabel *amountTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *amountLabel;
@property (nonatomic, weak) IBOutlet UILabel *legendLabel;

@property (nonatomic, weak) IBOutlet HomeButton *donateButton;
@property (nonatomic, weak) IBOutlet HomeButton *galleryButton;
@property (nonatomic, weak) IBOutlet HomeButton *teletonButton;
@property (nonatomic, weak) IBOutlet HomeButton *contactButton;
@property (nonatomic, assign) BOOL buttonsEnabled;

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iPhone-Logo.png"]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.height = imageView.height / 2;
        imageView.width = imageView.width / 2;
        self.navigationItem.titleView = imageView;
        self.bounceAnimationController = [BounceAnimationController new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    if ([UIDevice currentDevice].allowsiOS7Style) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    }
    
    self.navigationController.delegate = self;
    self.navigationItem.title = @"Inicio";

    self.amountTitleLabel.textColor = [Styles instance].pinkColor;
    
    self.donateButton.backgroundColor = [Styles instance].redColor;
    self.galleryButton.backgroundColor = [Styles instance].greenColor;
    self.teletonButton.backgroundColor = [Styles instance].orangeColor;
    self.contactButton.backgroundColor = [Styles instance].lightBlueColor;
    
    self.legendLabel.font = [UIFont fontWithName:@"Diamond Girl" size:20];
    [self setupContainers];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupRemaingDaysLabel];
    self.buttonsEnabled = YES;
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    switch (operation) {
        case UINavigationControllerOperationPop: self.bounceAnimationController.direction = BounceDirection_Right; break;
        case UINavigationControllerOperationPush: self.bounceAnimationController.direction = BounceDirection_Left; break;
        default: break;
    }
    return self.bounceAnimationController;
}

#pragma mark - Private
- (void)setupRemaingDaysLabel
{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy-MM-dd"];
    NSDate *startDate = [NSDate date];
    NSDate *endDate = [f dateFromString:@"2013-12-06"];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorianCalendar components:NSMinuteCalendarUnit | NSHourCalendarUnit | NSDayCalendarUnit
                                                        fromDate:startDate
                                                          toDate:endDate
                                                         options:0];
    
    CGFloat countdown = components.day;
    if (components.minute > 0 || components.hour > 0) {
        countdown +=1;
    }
    NSString *text = @"";
    if (countdown == 0 || countdown == -1) {
        text = @"¡Es hoy!";
    } else if   (countdown == 1) {
        text = @"FALTA 1 DÍA";
    } else if   (countdown > 1) {
        text = [NSString stringWithFormat:@"FALTAN %.0f DÍAS", countdown];
    } else {
        text = @"";
    }
    
    self.amountTitleLabel.font = [UIFont fontWithName:@"VAG-Rounded-Bold" size:16];
    self.amountLabel.font = [UIFont fontWithName:@"Diamond Girl" size:36];

    NSMutableAttributedString *attText = [[NSMutableAttributedString alloc] initWithString:text];
    NSRange pendingRange = [text rangeOfString:@"FALTA "];
    if (pendingRange.location == NSNotFound) {
        pendingRange = [text rangeOfString:@"FALTAN "];
    }
    
    
    if (pendingRange.location != NSNotFound) {
        [attText addAttribute:NSForegroundColorAttributeName
                        value:[Styles instance].pinkColor
                        range:pendingRange];
        [attText addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"VAG-Rounded-Bold" size:16]
                        range:pendingRange];
        
        NSString *daysText = countdown == 1 ? @"DÍA" : @"DÍAS";
        NSRange daysRange = [text rangeOfString:daysText];
        [attText addAttribute:NSForegroundColorAttributeName
                        value:[UIColor whiteColor]
                        range:daysRange];
        [attText addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"VAG-Rounded-Bold" size:16]
                        range:daysRange];

        NSRange dayCountRange = NSMakeRange(pendingRange.length, daysRange.location - pendingRange.length);
        [attText addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"VAG-Rounded-Bold" size:30]
                        range:dayCountRange];
        [attText addAttribute:NSBaselineOffsetAttributeName
                        value:@(-5)
                        range:dayCountRange];

    } else {
        [attText addAttribute:NSForegroundColorAttributeName
                        value:[UIColor whiteColor]
                        range:NSMakeRange(0, text.length)];
    }
    self.daysLabel.attributedText = attText;
}

#pragma mark - Actions
- (IBAction)donateButtonTouched:(id)sender
{
    UIViewController *vc = [DonateController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)galleryButtonTouched:(id)sender
{
    UIViewController *vc = [MediaListController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)teletonButtonTouched:(id)sender
{
    UIViewController *vc = [TeletonViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)contactButtonTouched:(id)sender
{
    UIViewController *vc = [InfoViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Rotation Handling
- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

#pragma mark - Private
- (void)setupContainers
{
    if (!is4InchDisplay) {
        self.daysLabel.top = 0;
        self.amountTitleLabel.top = 50;
        self.amountLabel.top = 65;
        self.legendLabel.top = 140;
    }
}

@end

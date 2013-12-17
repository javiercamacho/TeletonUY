//
//  ContributeViewController.m
//  Teleton
//
//  Created by Javi on 10/24/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "DonateController.h"
#import "Config.h"
#import "TransparentButton.h"
#import "HomeButton.h"
#import "OtherWaysController.h"
#import "PhonesController.h"

#define bitsTag 10000
#define smsTag 10001

@interface DonateController () <UIAlertViewDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *backgroundView;
@property (nonatomic, weak) IBOutlet UIView *smsContainer;
@property (nonatomic, weak) IBOutlet UIView *callContainer;
@property (nonatomic, weak) IBOutlet UIView *bitsContainer;
@property (nonatomic, weak) IBOutlet UIView *otherWaysContainer;
@property (nonatomic, weak) IBOutlet UIView *sistarbancContainer;
@property (nonatomic, weak) IBOutlet HomeButton *smsButton;
@property (nonatomic, weak) IBOutlet HomeButton *callButton;
@property (nonatomic, weak) IBOutlet HomeButton *bitsButton;
@property (nonatomic, weak) IBOutlet HomeButton *otherWaysButton;
@property (nonatomic, weak) IBOutlet HomeButton *sistarbancButton;
@property (nonatomic, weak) IBOutlet UILabel *smsLabel;
@property (nonatomic, weak) IBOutlet UILabel *callLabel;
@property (nonatomic, weak) IBOutlet UILabel *bitsLabel;
@property (nonatomic, weak) IBOutlet UILabel *otherWaysLabel;
@property (nonatomic, weak) IBOutlet UILabel *sistarbancLabel;

@property (nonatomic, strong) NSArray *buttons;
@property (nonatomic, assign) BOOL buttonsEnabled;

@end

@implementation DonateController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Donar";
    self.buttons = @[self.smsButton, self.callButton, self.bitsButton,self.sistarbancButton, self.otherWaysButton];
    [self setupContainers];
    
    self.callLabel.font = [UIFont fontWithName:@"VAG-Rounded-Bold" size:16];
    self.bitsLabel.font = [UIFont fontWithName:@"VAG-Rounded-Bold" size:16];
    self.smsLabel.font = [UIFont fontWithName:@"VAG-Rounded-Bold" size:16];
    self.sistarbancLabel.font = [UIFont fontWithName:@"VAG-Rounded-Bold" size:16];
    self.otherWaysLabel.font = [UIFont fontWithName:@"VAG-Rounded-Bold" size:16];
    
    [self setupContainers];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.buttonsEnabled = YES;
    self.navigationController.navigationBarHidden = NO;
    [self setupButtons];

}

- (void)refreshViews
{
    [self setupButtons];
}

#pragma mark - Actions
- (IBAction)smsButtonTouched:(id)sender
{
    if (!self.buttonsEnabled) {
        return;
    }
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Envía TELETON para donar 10 pesos" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    alertView.tag = smsTag;
	[alertView show];
}

- (IBAction)callButtonTouched:(id)sender
{
    if (!self.buttonsEnabled) {
        return;
    }
    self.buttonsEnabled = NO;
    PhonesController *controller = [PhonesController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)bitsButtonTouched:(id)sender
{
    if (!self.buttonsEnabled) {
        return;
    }
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Envía TELETON 100,  200 o 300, dependiendo del monto que quieras donar" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    alertView.tag = bitsTag;
	[alertView show];
}

- (IBAction)sistarbancButtonTouched:(id)sender
{
    if (!self.buttonsEnabled) {
        return;
    }
    [[UIApplication sharedApplication] openURL:[Config instance].sistarbancURL];
}

- (IBAction)otherWaysButtonTouched:(id)sender
{
    if (!self.buttonsEnabled) {
        return;
    }
    self.buttonsEnabled = NO;
    OtherWaysController *controller = [OtherWaysController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)share:(id)sender
{
    if (!self.buttonsEnabled) {
        return;
    }
    [super share:sender];
}
    
#pragma mark - Private
- (void)setupContainers
{
    if (!is4InchDisplay) {
        CGFloat contentHeight = 65;
        CGFloat padding = 8;
        self.callContainer.height = contentHeight;
        self.bitsContainer.height = contentHeight;
        self.smsContainer.height = contentHeight;
        self.sistarbancContainer.height = contentHeight;
        self.otherWaysContainer.height = contentHeight;
        
        self.callContainer.top = padding;
        self.bitsContainer.top = self.callContainer.bottom + padding;
        self.smsContainer.top = self.bitsContainer.bottom + padding;
        self.sistarbancContainer.top = self.smsContainer.bottom + padding;
        self.otherWaysContainer.top = self.sistarbancContainer.bottom + padding;
        
        CGRect buttonFrame = CGRectMake(204, 0, 76, 65);
        self.callButton.frame = buttonFrame;
        self.bitsButton.frame = buttonFrame;
        self.smsButton.frame = buttonFrame;
        self.sistarbancButton.frame = buttonFrame;
        self.otherWaysButton.frame = buttonFrame;
    }
}

- (void)setupButtons
{
    for (TransparentButton *button in self.buttons) {
//        button.highlighted = NO;
//        button.parentView = self.backgroundView;
//        button.layer.cornerRadius = 5;
//        button.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    }
}

- (void)sendTextMessage:(NSString *)recipient
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms:%@",recipient]]];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == bitsTag) {
        [self sendTextMessage:[Config instance].bitsNumber];
    } else if (alertView.tag == smsTag) {
        [self sendTextMessage:[Config instance].textNumber];
    }
}

#pragma mark - Rotation Handling
- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

@end

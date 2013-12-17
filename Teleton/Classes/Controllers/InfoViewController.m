//
//  InfoViewController.m
//  Teleton
//
//  Created by Javi on 10/24/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "InfoViewController.h"
#import "SharingViewController.h"
#import "InfoHeaderView.h"
#import "ContactInfoCell.h"
#import "TeletonAlertView.h"

@interface InfoViewController ()
<MFMailComposeViewControllerDelegate, UICollectionViewDataSource, ContactInfoCellDelegate, UIAlertViewDelegate, UICollectionViewDelegateFlowLayout, InfoHeaderViewDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *contacts;

@end

@implementation InfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Contactos";
    self.contacts = [Facade instance].contacts;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"InfoHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ContactInfoCell" bundle:nil] forCellWithReuseIdentifier:@"ContactInfoCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - UICollectionViewDataSource
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    InfoHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    headerView.delegate = self;
    [headerView load];
    return headerView;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    return self.contacts.count;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"ContactInfoCell";
    ContactInfoCell *cell = [cv dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.contact = [self.contacts objectAtIndex:indexPath.row];
    cell.delegate = self;
    return cell;
}

#pragma mark - ContactInfoDelegate
- (void)callPhone:(NSNumber *)phone
{
    NSString *URLString = [NSString stringWithFormat:@"tel://%@", phone];
    NSURL *URL = [NSURL URLWithString:URLString];
    [[UIApplication sharedApplication] openURL:URL];
}

- (void)sendEmail:(NSString *)mail
{
    NSArray *recipents = @[mail];

    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *messageController = [MFMailComposeViewController new];
        messageController.mailComposeDelegate = self;
        [messageController setToRecipients:recipents];
        [messageController setMessageBody:@"" isHTML:NO];
        [self presentViewController:messageController animated:YES completion:nil];
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Contact *contact = [self.contacts objectAtIndex:indexPath.row];
    if (is4InchDisplay) {
        return CGSizeMake(collectionView.width, 16 + contact.secondaryInfoCount * 20);
    } else {
        return CGSizeMake(collectionView.width, 6 + contact.secondaryInfoCount * 20);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (is4InchDisplay) {
        return CGSizeMake(320,90);
    } else {
        return CGSizeMake(320,70);
    }
}

#pragma mark - MFMessageComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    TeletonAlertView *alertView;
    switch (result) {
        case MFMailComposeResultSent:
            alertView = [TeletonAlertView alertViewWithDelegate:self message:@"El correo ha sido enviado"];
            alertView.tag = 2;
            [alertView show];
            break;
        case MFMailComposeResultCancelled:
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        case MFMailComposeResultFailed:
            alertView = [TeletonAlertView alertViewWithDelegate:self message:@"No se ha podido enviar el correo"];
            alertView.tag = 1;
            [alertView show];
            break;
        default:
            
            break;
    }
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 2) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end

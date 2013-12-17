//
//  PhotoDetailsController.m
//  Teleton
//
//  Created by Javi on 10/30/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "PhotoDetailsController.h"
#import "PhotoDetailCell.h"
#import "PhotoItem.h"
#import "SharingViewController.h"

@interface PhotoDetailsController () <UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UINavigationBar *navigationBar;
@property (nonatomic, weak) IBOutlet UICollectionView *photoCollection;
@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, assign) CGSize cellSize;

@end

@implementation PhotoDetailsController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.photos = [Facade instance].photos;
        self.cellSize = self.photoCollection.size;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self.navigationBar respondsToSelector:@selector(setBarTintColor:)]) {
    } else {
        [self.navigationBar setTintColor:[UIColor colorWithRed:134/255.0 green:5/255.0 blue:12/255.0 alpha:0.8]];
    }

    [self.photoCollection registerClass:PhotoDetailCell.class forCellWithReuseIdentifier:@"PhotoDetailCell_P"];
    [self.photoCollection registerClass:PhotoDetailCell.class forCellWithReuseIdentifier:@"PhotoDetailCell_L"];
    [self willAnimateRotationToInterfaceOrientation:[UIApplication sharedApplication].statusBarOrientation duration:0];
    
    
    self.photoCollection.backgroundView = [[UIView alloc] initWithFrame:self.photoCollection.bounds];
    self.photoCollection.backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    //self.title = @"Galería";
    
    [self.photoCollection addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.photoCollection setContentOffset:CGPointMake(self.selectedIndex * self.cellSize.width, 0) animated:YES];
    [self showToolbar];
}

#pragma mark - Actions
- (IBAction)share:(id)sender
{
    self.selectedIndex = self.photoCollection.contentOffset.x / self.photoCollection.width;
    PhotoItem *selectedItem = [self.photos objectAtIndex:self.selectedIndex];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:selectedItem.imageName ofType:nil]];
    SharingViewController *controller = [[SharingViewController alloc] initWithActivityItems:@[[Config instance].shareMessage, [Config instance].shareURL, url]
                                                    applicationActivities:nil];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)done:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoDetailCell *cell_P = [cv dequeueReusableCellWithReuseIdentifier:@"PhotoDetailCell_P" forIndexPath:indexPath];
    PhotoDetailCell *cell_L = [cv dequeueReusableCellWithReuseIdentifier:@"PhotoDetailCell_L" forIndexPath:indexPath];
    PhotoItem *photoItem = [self.photos objectAtIndex:indexPath.row];
    cell_L.image = [UIImage imageNamed:photoItem.imageName];
    cell_P.image = [UIImage imageNamed:photoItem.imageName];
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return cell_L;
    }
    return cell_P;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)cv layout:(UICollectionViewLayout*)cvl sizeForItemAtIndexPath:(NSIndexPath *)ip
{
    CGFloat bigger = MAX(self.photoCollection.width, self.photoCollection.height);
    CGFloat smaller = MIN(self.photoCollection.width, self.photoCollection.height);
    if  (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        self.cellSize = CGSizeMake(bigger, smaller);
    } else {
        self.cellSize = CGSizeMake(smaller, bigger);
    }
    return self.cellSize;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)cv layout:(UICollectionViewLayout*)cvl insetForSectionAtIndex:(NSInteger)s
{
    return UIEdgeInsetsZero;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.selectedIndex = self.photoCollection.contentOffset.x / self.photoCollection.width;
}

#pragma mark - Rotation Handling
- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];

    [self updateCellSizeForInterfaceOrientation:toInterfaceOrientation];
    [self.photoCollection reloadData];
    [self.photoCollection setContentOffset:CGPointMake(self.selectedIndex * self.cellSize.width, 0) animated:NO];

    if (self.toolbar.bottom == self.photoCollection.bottom) {
        [self showToolbar];
    } else {
        [self hideToolbar];
    }
}

#pragma mark - Private
- (void)viewTapped
{
    if (self.toolbar.bottom == self.photoCollection.bottom) {
        [self hideToolbar];
    } else {
        [self showToolbar];
    }
}
- (void)showToolbar
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationBar.hidden = NO;
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.toolbar.bottom = self.photoCollection.bottom;
                         self.navigationBar.top = self.photoCollection.top;
                         
    } completion:^(BOOL finished) {
        if ([UIDevice currentDevice].allowsiOS7Style) {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        } else {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
        }
    }];
}

- (void)hideToolbar
{
    
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.toolbar.top = self.photoCollection.bottom;
                         self.navigationBar.bottom = self.photoCollection.top;
    } completion:^(BOOL finished) {
        self.navigationBar.hidden = YES;
        self.view.backgroundColor = [UIColor blackColor];
        if ([UIDevice currentDevice].allowsiOS7Style) {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        } else {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
        }
    }];
}

- (void)updateCellSizeForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    CGFloat bigger = MAX(self.photoCollection.width, self.photoCollection.height);
    CGFloat smaller = MIN(self.photoCollection.width, self.photoCollection.height);
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        self.cellSize = CGSizeMake(bigger, smaller);
    } else {
        self.cellSize = CGSizeMake(smaller, bigger);
    }
}

@end
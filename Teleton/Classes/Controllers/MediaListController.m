//
//  PhotoViewController.m
//  Teleton
//
//  Created by Javi on 10/24/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "MediaListController.h"
#import "MediaCell.h"
#import "PhotoItem.h"
#import "PhotoDetailsController.h"

@interface MediaListController ()

@property (nonatomic, weak) IBOutlet UICollectionView *photoCollection;
@property (nonatomic, strong) NSArray *photos;

@end

@implementation MediaListController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.photos = [Facade instance].photos;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Galería";
    
    [self.photoCollection registerClass:MediaCell.class forCellWithReuseIdentifier:@"PhotoItemCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
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
    MediaCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"PhotoItemCell" forIndexPath:indexPath];
    PhotoItem *photoItem = [self.photos objectAtIndex:indexPath.row];
    cell.image = [UIImage imageNamed:photoItem.imageName];
    cell.displayStyle = PhotoItemStyle_Polaroid;
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoDetailsController *vc = [PhotoDetailsController new];
    vc.selectedIndex = indexPath.row;
    if ([vc respondsToSelector:@selector(setTransitioningDelegate:)]) {
        vc.transitioningDelegate = vc;
    }
    [self presentViewController:vc animated:YES completion:nil];
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

@end

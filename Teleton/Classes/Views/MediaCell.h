//
//  MediaCell.h
//  Teleton
//
//  Created by Javi on 11/2/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    PhotoItemStyle_Polaroid,
    PhotoItemStyle_Plain
} PhotoItemStyle;

@interface MediaCell : UICollectionViewCell

@property (nonatomic, assign) PhotoItemStyle displayStyle;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSURL *videoURL;

@end

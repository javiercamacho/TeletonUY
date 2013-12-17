//
//  PhotoItem.m
//  Teleton
//
//  Created by Javi on 10/24/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "PhotoItem.h"

@implementation PhotoItem

+ (id)createPhotoWithImageName:(NSString *)imageName
{
    PhotoItem *item = [PhotoItem new];
    item.imageName = imageName;
    return item;
}

@end

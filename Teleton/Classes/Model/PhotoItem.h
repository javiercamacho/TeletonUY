//
//  PhotoItem.h
//  Teleton
//
//  Created by Javi on 10/24/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoItem : NSObject

@property (nonatomic, strong) NSString *imageName;

+ (id)createPhotoWithImageName:(NSString *)imageName;

@end

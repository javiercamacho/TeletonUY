//
//  Facade.h
//  Teleton
//
//  Created by Javi on 10/24/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Facade : NSObject

+ (Facade *)instance;

@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, strong) NSArray *contacts;

@end

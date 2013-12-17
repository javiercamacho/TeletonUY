//
//  Config.h
//  Teleton
//
//  Created by Javi on 10/24/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Config : NSObject

+ (Config *)instance;

@property (nonatomic, readonly) NSString *shareMessage;
@property (nonatomic, readonly) NSURL *shareURL;
@property (nonatomic, readonly) NSString *textNumber;
@property (nonatomic, readonly) NSString *bitsNumber;
@property (nonatomic, readonly) NSArray *callOptions;
@property (nonatomic, readonly) NSArray *bitsOptions;
@property (nonatomic, readonly) NSURL *websiteURL;
@property (nonatomic, readonly) NSURL *sistarbancURL;

- (NSString *)callNumberForOption:(NSString *)option;

@end

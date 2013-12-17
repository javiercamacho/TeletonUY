//
//  Contact.h
//  Teleton
//
//  Created by Javi on 11/6/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *phoneText;
@property (nonatomic, strong) NSString *cellphone;
@property (nonatomic, strong) NSString *cellphoneText;
@property (nonatomic, strong) NSString *mail;
@property (nonatomic, strong) NSString *secondMail;

@property (nonatomic, readonly) NSInteger secondaryInfoCount;

@end

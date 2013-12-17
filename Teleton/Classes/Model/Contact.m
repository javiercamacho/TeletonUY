//
//  Contact.m
//  Teleton
//
//  Created by Javi on 11/6/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (NSInteger)secondaryInfoCount
{
    NSInteger count = 2;
    if (self.phone && self.phone.length > 0) count++;
    if (self.cellphone && self.cellphone.length > 0) count++;
    if (self.mail && self.mail.length > 0) count++;
    if (self.secondMail && self.secondMail.length > 0) count++;
    return count;
}

@end

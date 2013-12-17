//
//  Facade.m
//  Teleton
//
//  Created by Javi on 10/24/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "Facade.h"
#import "PhotoItem.h"
#import "Contact.h"

@implementation Facade

+ (Facade *)instance
{
    static Facade *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Facade new];
    });
    return sharedInstance;
}

- (id)init
{
    self  = [super init];
    if (self) {
        self.photos = self.photos = @[[PhotoItem createPhotoWithImageName:@"teleton_01.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_02.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_03.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_04.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_05.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_06.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_07.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_08.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_09.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_10.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_11.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_12.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_13.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_14.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_15.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_16.jpg"],
                                      [PhotoItem createPhotoWithImageName:@"teleton_17.jpg"]];
        
        Contact *c1 = [Contact new];
        c1.title = @"Auspicios y donaciones";
        c1.name = @"Diego Cajade";
        c1.phone = nil;
        c1.phoneText = nil;
        c1.cellphone = @"098432336";
        c1.cellphoneText = @"098 432 336";
        c1.mail = @"dcajade@teleton.org.uy";
        c1.secondMail = nil;

        Contact *c2 = [Contact new];
        c2.title = @"Prensa y relaciones institucionales";
        c2.name = @"Mariana Goday";
        c2.phone = nil;
        c2.phoneText = nil;
        c2.cellphone = @"091072267";
        c2.cellphoneText = @"091 072 267";
        c2.mail = @"mgoday@teleton.org.uy";
        c2.secondMail = nil;

        Contact *c3 = [Contact new];
        c3.title = @"Área de Voluntariado";
        c3.name = @"Silvia Gober";
        c3.phone = nil;
        c3.phoneText = nil;
        c3.cellphone = @"098446265";
        c3.cellphoneText = @"098 446 265";
        c3.mail = @"voluntariado@teleton.org.uy";
        c3.secondMail = @"sgober@teleton.org.uy";

        self.contacts = @[c1, c2, c3];
    }
    return self;
}

@end

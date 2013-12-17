//
//  SharingViewController.m
//  Teleton
//
//  Created by Javi on 10/31/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "SharingViewController.h"

@implementation SharingViewController

- (id)init
{
    self = [super initWithActivityItems:@[[Config instance].shareMessage, [Config instance].shareURL]
                  applicationActivities:nil];
    if (self) {
        if ([UIDevice currentDevice].allowsiOS7Style) {
            self.excludedActivityTypes = @[UIActivityTypeAddToReadingList,
                                           UIActivityTypeCopyToPasteboard,
                                           UIActivityTypeAirDrop,
                                           UIActivityTypePostToTencentWeibo,
                                           UIActivityTypePostToVimeo];
        } else {
            self.excludedActivityTypes = @[UIActivityTypePostToWeibo,
                                           UIActivityTypePrint,
                                           UIActivityTypeCopyToPasteboard,
                                           UIActivityTypeAssignToContact,
                                           UIActivityTypeSaveToCameraRoll];
        }
    }
    return self;
}

@end

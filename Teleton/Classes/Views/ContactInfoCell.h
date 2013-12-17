//
//  ContactInfoCell.h
//  Teleton
//
//  Created by Javi on 11/6/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "Contact.h"

@protocol ContactInfoCellDelegate <NSObject>

- (void)callPhone:(NSString *)phone;
- (void)sendEmail:(NSString *)mail;

@end

@interface ContactInfoCell : UICollectionViewCell

@property (nonatomic, strong) Contact *contact;
@property (nonatomic, weak) id<ContactInfoCellDelegate> delegate;

@end

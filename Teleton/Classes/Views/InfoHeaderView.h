//
//  InfoHeaderView.h
//  Teleton
//
//  Created by Javi on 11/13/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InfoHeaderViewDelegate <NSObject>

- (void)callPhone:(NSString *)phone;
- (void)sendEmail:(NSString *)mail;

@end

@interface InfoHeaderView : UICollectionReusableView

@property (nonatomic, weak) id<InfoHeaderViewDelegate> delegate;

- (void)load;

@end

//
//  AvatarView.h
//  Piner
//
//  Created by Gamy on 14-1-14.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import <UIKit/UIKit.h>
@class User;
@interface AvatarView : UIControl

@property(nonatomic, strong)NSString *userId;
@property(nonatomic, strong)User *user;

- (void)setAvatarURL:(NSString *)URL placeholder:(UIImage *)image;

@end

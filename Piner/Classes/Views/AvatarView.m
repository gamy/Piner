//
//  AvatarView.m
//  Piner
//
//  Created by Gamy on 14-1-14.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "AvatarView.h"
#import "NSString+Ext.h"
#import "UIImageView+Ext.h"

@interface AvatarView()
@property(nonatomic, weak)UIImageView *imageView;
@end

@implementation AvatarView


- (id)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self baseInit];
    }
    return self;
}


- (void)baseInit
{
    self.backgroundColor = [UIColor clearColor];
    [self.imageView removeFromSuperview];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.autoresizingMask = (0x1 << 6) - 1;
    imageView.userInteractionEnabled = YES;
    [self addSubview:imageView];
    self.imageView = imageView;
}

- (void)setAvatarURL:(NSString *)URL placeholder:(UIImage *)image
{
    [self.imageView setImageWithURL:URL placeholderImage:image animated:YES];
}

- (void)setUser:(User *)user
{
    _user = user;
    [self setAvatarURL:[user.avatar URL] placeholder:self.imageView.image];
}

@end

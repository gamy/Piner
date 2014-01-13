//
//  UIImageView+Ext.m
//  Piner
//
//  Created by Gamy on 14-1-12.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "UIImageView+Ext.h"

@implementation UIImageView(Ext)

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder animated:(BOOL)animated
{
    __weak UIImageView *cp = self;
    [self setImageWithURL:url placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        if (image != nil && animated && cacheType == SDImageCacheTypeNone) {
            cp.alpha = 0.0f;
            [UIView animateWithDuration:1 animations:^{
                cp.alpha = 1.0f;
            } completion:^(BOOL finished) {
                cp.alpha = 1.0f;
            }];
        }
    }];
}
- (void)setImageWithURL:(NSURL *)url animated:(BOOL)animated
{
    [self setImageWithURL:url placeholderImage:Nil animated:animated];
}


@end

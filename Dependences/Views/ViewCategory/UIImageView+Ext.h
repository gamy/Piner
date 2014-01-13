//
//  UIImageView+Ext.h
//  Piner
//
//  Created by Gamy on 14-1-12.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImageView+WebCache.h"

@interface UIImageView(Ext)

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder animated:(BOOL)animated;
- (void)setImageWithURL:(NSURL *)url animated:(BOOL)animated;

@end

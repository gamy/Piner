//
//  CGUtil.m
//  Piner
//
//  Created by Gamy on 14-1-7.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "CGUtil.h"

@implementation CGUtil

+ (CGSize)adjustSize:(CGSize)size withConstHeight:(CGFloat)height
{
    if (height <= 0 || size.height <= 0) {
        return CGSizeZero;
    }
    CGFloat width = size.width/size.height * height;
    return CGSizeMake(width, height);
}


@end

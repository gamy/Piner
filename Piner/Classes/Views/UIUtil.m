//
//  UIUtil.m
//  Piner
//
//  Created by Gamy on 14-1-7.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "UIUtil.h"

@implementation UIUtil

//Font
+ (UIFont *)nickFont
{
    return FONT(15);
}
+ (UIFont *)timeFont
{
    return FONT(10);
}
+ (UIFont *)contentFont
{
    return FONT(13)
}

//Color
+ (UIColor *)nickColor
{
    return [KXKiOS7Colors lightBlue];
}
+ (UIColor *)timeColor
{
    return [KXKiOS7Colors darkGrey];
}
+ (UIColor *)contentColor
{
    return [UIColor darkTextColor];
}
@end

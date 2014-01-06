//
//  UIUtil.h
//  Piner
//
//  Created by Gamy on 14-1-7.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>


#define FONT(x) [UIFont systemFontOfSize:x];
#define BFONT(x) [UIFont boldSystemFontOfSize:x];
#define COLOR255(r,g,b,a) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:(a/255.0)]


@interface UIUtil : NSObject

//Font
+ (UIFont *)nickFont;
+ (UIFont *)timeFont;
+ (UIFont *)contentFont;

//Color
+ (UIColor *)nickColor;
+ (UIColor *)timeColor;
+ (UIColor *)contentColor;

@end

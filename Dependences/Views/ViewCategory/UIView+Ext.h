//
//  UIView+Ext.h
//  Piner
//
//  Created by Gamy on 13-12-28.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(Ext)

- (CGRect)updateOriginX:(CGFloat)x;
- (CGRect)updateOriginY:(CGFloat)y;
- (CGRect)updateSizeWidth:(CGFloat)width;
- (CGRect)updateSizeHeight:(CGFloat)height;
- (CGRect)updateCenterX:(CGFloat)x;
- (CGRect)updateCenterY:(CGFloat)y;
- (void)setRoundCorner:(CGFloat)radius border:(CGFloat)border borderColor:(UIColor *)color;
- (void)setRoundCorner:(CGFloat)radius;

+ (instancetype)viewFromXib:(NSString *)xibName index:(NSInteger)index;
+ (instancetype)viewFromXib:(NSString *)xibName;


@end

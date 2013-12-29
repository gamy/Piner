//
//  UIFactory.m
//  Piner
//
//  Created by Gamy on 13-12-29.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "UIFactory.h"
#import "KXKiOS7Colors.h"
@implementation UIFactory


+ (void)updateButton:(UIButton *)button
     backgroundColor:(UIColor *)bgColor
           textColor:(UIColor *)textColor
{
    [button setBackgroundColor:bgColor];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setRoundCorner:5];
    [button.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
}

+ (void)updateAccessButton:(UIButton *)button
{
    [self updateButton:button backgroundColor:[KXKiOS7Colors darkGreen] textColor:[UIColor whiteColor]];
}

+ (void)updateOptionalButton:(UIButton *)button
{
    [self updateButton:button backgroundColor:[KXKiOS7Colors darkBlue] textColor:[UIColor whiteColor]];
}

+ (void)updateUnrecommandButton:(UIButton *)button
{
    [self updateButton:button backgroundColor:[KXKiOS7Colors darkPink] textColor:[UIColor whiteColor]];
}

+ (void)updateDisableButton:(UIButton *)button
{
    [self updateButton:button backgroundColor:[KXKiOS7Colors darkGrey] textColor:[UIColor whiteColor]];
}


@end

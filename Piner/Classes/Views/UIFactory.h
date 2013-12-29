//
//  UIFactory.h
//  Piner
//
//  Created by Gamy on 13-12-29.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIFactory : NSObject

+ (void)updateAccessButton:(UIButton *)button;
+ (void)updateOptionalButton:(UIButton *)button;
+ (void)updateUnrecommandButton:(UIButton *)button;
+ (void)updateDisableButton:(UIButton *)button;

@end

//
//  NSString+Ext.m
//  Piner
//
//  Created by Gamy on 14-1-7.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "NSString+Ext.h"

@implementation NSString(Ext)

- (NSURL *)URL
{
    return [NSURL URLWithString:self];
}

@end

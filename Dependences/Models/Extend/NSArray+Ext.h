//
//  NSArray+Ext.h
//  Piner
//
//  Created by Gamy on 13-12-22.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^EnumValueBlock)(id value);


@interface NSArray(Ext)

- (void)enumerate:(EnumValueBlock) block;
- (void)reverseEnumerate:(EnumValueBlock) block;

@end

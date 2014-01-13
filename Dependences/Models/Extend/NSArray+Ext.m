//
//  NSArray+Ext.m
//  Piner
//
//  Created by Gamy on 13-12-22.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "NSArray+Ext.h"

@implementation NSArray(Ext)

- (void)enumerate:(EnumValueBlock) block
{
    if (block == NULL) {
        return;
    }
    for (id value in self) {
        block(value);
    }
}
- (void)reverseEnumerate:(EnumValueBlock) block
{
    if (block == NULL) {
        return;
    }
    NSInteger count = [self count];
    for (int i = count - 1; i >= 0; i --) {
        id value = self[i];
        block(value);
    }

}

+ (BOOL)isArray:(id)obj
{
    return [obj isKindOfClass:[NSArray class]];
}

- (NSArray *)unique
{
    if ([self count] == 0) {
        return self;
    }
    NSMutableSet *set = [NSMutableSet set];
    NSMutableArray *ret = [NSMutableArray array];
    for (id obj in self) {
        if (![set containsObject:obj]) {
            [set addObject:obj];
            [ret addObject:obj];
        }
    }
    return ret;
}
@end

//
//  NSDictionary+Ext.m
//  Piner
//
//  Created by Gamy on 13-12-22.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "NSDictionary+Ext.h"

@implementation NSDictionary(Ext)

- (void)enumerate:(void (^)(id key, id value))block
{
    if (block == NULL) {
        return;
    }
    
    NSArray *keys = [self allKeys];
    for (id key in keys) {
        id value = self[key];
        block(key, value);
    }
}

+ (BOOL)isDictionary:(id)obj
{
    return [obj isKindOfClass:[NSDictionary class]];
}
@end

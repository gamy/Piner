//
//  NSDictionary+Ext.h
//  Piner
//
//  Created by Gamy on 13-12-22.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary(Ext)

- (void)enumerate:(void (^)(id key, id value))block;

@end

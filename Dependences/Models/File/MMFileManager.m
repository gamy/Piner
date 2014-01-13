//
//  MMFileManager.m
//  Piner
//
//  Created by Gamy on 13-12-21.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "MMFileManager.h"

@implementation MMFileManager

+(NSString *)appDocumentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

@end

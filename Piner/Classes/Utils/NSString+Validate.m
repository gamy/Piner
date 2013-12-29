//
//  StringUtils.m
//  Piner
//
//  Created by Gamy on 13-12-29.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "NSString+Validate.h"


@implementation NSString(Validate)

- (BOOL)isValidAccount
{
    NSError *error = nil;
    NSRegularExpression *r = [NSRegularExpression regularExpressionWithPattern:@"^[_a-zA-Z0-9]{6,16}$" options:NSRegularExpressionAnchorsMatchLines error:&error];
    if (error) {
        NSLog(@"error = %@", error);
    }
    NSArray *results = [r matchesInString:self
                                  options:NSMatchingWithoutAnchoringBounds
                                    range:NSMakeRange(0, [self length])];    
    return [results count] > 0;
}

//return error string.
- (NSString *)checkMinLength:(NSUInteger)minLength
                   maxLength:(NSUInteger)maxLength;
{
    NSUInteger len = [self length];
    if (len == 0) {
        return @"不能为空。";
    }
    if (len < minLength) {
        return [NSString stringWithFormat:@"不能少于%d个字符。", minLength];
    }
    if (len < maxLength) {
        return [NSString stringWithFormat:@"不能多于%d个字符。", maxLength];
    }
    return nil;
}

@end

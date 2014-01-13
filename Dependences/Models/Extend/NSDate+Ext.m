//
//  NSDate+Ext.m
//  Piner
//
//  Created by Gamy on 14-1-8.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "NSDate+Ext.h"

@implementation NSDate(Ext)

#define SECONDS_MINUTE 60
#define SECONDS_HOUR 60*60
#define SECONDS_DAY 60*60*24

#define DEFAULT_FORMAT @"yyyy-MM-dd"

+ (NSDateFormatter *)defaultFormatter
{
    static dispatch_once_t onceToken;
    static NSDateFormatter *format;
    dispatch_once(&onceToken, ^{
        format = [[NSDateFormatter alloc] init];
        [format setLocale:[NSLocale currentLocale]];
        [format setDateFormat:DEFAULT_FORMAT];
    });
    return format;
}

- (NSString *)timelineStamp
{
    NSTimeInterval interval = -[self timeIntervalSinceNow];
    if (interval < SECONDS_MINUTE) {
        return @"刚刚";
    }
    if (interval < SECONDS_HOUR) {
        return [NSString stringWithFormat:@"%d分钟前", (NSInteger)(interval/SECONDS_MINUTE)];
    }
    if (interval < SECONDS_HOUR) {
        return [NSString stringWithFormat:@"%d小时前", (NSInteger)(interval/SECONDS_HOUR)];
    }else{
        return [[NSDate defaultFormatter] stringFromDate:self];
    }
}

@end

//
//  PinError.m
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "PinError.h"

@implementation PinError

+ (NSError *)errorWithCode:(NSInteger)code message:(NSString *)message
{
    if ([message length] == 0) {
        message = [@(code) stringValue];
    }
    NSDictionary *info = @{NSLocalizedDescriptionKey: message};
    return [NSError errorWithDomain:@"PinHost" code:code userInfo:info];
}
@end

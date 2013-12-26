//
//  PinAPIClient.m
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "PinAPIClient.h"

@implementation PinAPIClient

static NSString * const PinAPIClientHost = @"http://localhost:3000/";

+ (instancetype)sharedClient {
    static PinAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[PinAPIClient alloc] initWithBaseURL:[NSURL URLWithString:PinAPIClientHost]];
    });
    
    return _sharedClient;
}

@end

//
//  PinService+Auth.m
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "PinService.h"

@implementation PinService(Auth)


- (NSURLSessionDataTask *)signin:(NSString *)name password:(NSString *)password callback:(ObjectCallback)callback
{
    NSLog(@"signin");
    return nil;
}

- (NSURLSessionDataTask *)signup:(NSString *)name password:(NSString *)password callback:(ObjectCallback)callback
{
    return [self POST:@"users/signup" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
    } callback:^(NSError *error, NSDictionary *jsonData) {
        if (error) {
            
        }else{
            //TODO parse jsonData
        }
    }];
}

- (NSURLSessionDataTask *)logoutWithCallback:(SimpleCallback)callback
{
     NSLog(@"logout");
    return nil;
}

@end

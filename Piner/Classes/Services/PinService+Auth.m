//
//  PinService+Auth.m
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "PinService.h"
#import "ModelManager.h"


@implementation PinService(Auth)



- (NSURLSessionDataTask *)signin:(NSString *)name password:(NSString *)password callback:(ObjectCallback)callback
{
    NSDictionary *parameters = @{@"name": name, @"password":password};
    return [self POST:@"auth/signin" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
    } callback:^(NSError *error, NSDictionary *jsonDict, NSArray *jsonList) {
        if (callback != NULL) {
            if (error) {
                callback(error, nil);
            }else{
                User *user = [[ModelManager mainManager] parseUserWithJson:jsonDict];
                callback(nil, user);
            }
        }
    }];
}

- (NSURLSessionDataTask *)signup:(NSString *)name password:(NSString *)password callback:(ObjectCallback)callback
{
    NSDictionary *parameters = @{@"name": name, @"password":password};
    return [self POST:@"auth/signup" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
    } callback:^(NSError *error, NSDictionary *jsonDict, NSArray *jsonList) {
        if (callback != NULL) {
            if (error) {
                callback(error, nil);
            }else{
                User *user = [[ModelManager mainManager] parseUserWithJson:jsonDict];
                callback(nil, user);
            }
        }
    }];
}

- (NSURLSessionDataTask *)logoutWithCallback:(SimpleCallback)callback
{
     NSLog(@"logout");
    return nil;
}

@end

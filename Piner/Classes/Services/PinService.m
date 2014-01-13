//
//  PinService.m
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "PinService.h"

@implementation PinService

+ (id)sharedService
{
    static dispatch_once_t onceToken;
    static PinService *_staticService;
    dispatch_once(&onceToken, ^{
        _staticService = [PinService serviceWithAPIClinet:[PinAPIClient sharedClient]];
    });
    
    return _staticService;
}

- (instancetype)initWithClient:(AFHTTPSessionManager *)client
{
    self = [super init];
    if (self) {
        _client = client;
    }
    return self;
}

+ (instancetype)serviceWithAPIClinet:(AFHTTPSessionManager *)client
{
    PinService *service = [[PinService alloc] initWithClient:client];
    return service;
}

- (AFHTTPSessionManager *)apiClient
{
    return _client;
}


+ (SuccessCallback)successCallback:(JSONCallback)callback
{
    return  ^(NSURLSessionDataTask *task, id responseObject){
        if (callback != NULL) {
            NSError *error = nil;
            NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:&error];
            NSDictionary *json = nil;
            if (!error) {
                json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            }
            if (!error) {
                NSInteger code = [json[@"code"] integerValue];
                if (code != 0) {
                    NSString *message = json[@"message"];
                    error = [PinError errorWithCode:code message:message];
                }
            }
            NSArray *jsonList = nil;
            NSDictionary *jsonDict = nil;
            if (error) {
                NSLog(@"error = %@",error);
                json = nil;
            }else{
                id data = json[@"data"];
                if ([data isKindOfClass:[NSArray class]]) {
                    jsonList = data;
                    NSLog(@"return is list, list count = %d", [jsonList count]);
                }else if([data isKindOfClass: [NSDictionary class]]){
                    jsonDict = data;
                    NSLog(@"return is dict, dict count = %d", [jsonDict count]);
                }
            }
            callback(error, jsonDict, jsonList);
        }
    };
}

+ (FailureCallback)failureCallback:(JSONCallback)callback
{
    return ^(NSURLSessionDataTask *task, NSError *error){
        if (callback != NULL) {
            callback(error, nil, nil);
        }
    };
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                     callback:(JSONCallback)callback
{
    return [self.apiClient GET:URLString
                    parameters:parameters
                       success:[PinService successCallback:callback]
                       failure:[PinService failureCallback:callback]];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
     constructingBodyWithBlock:(FormDataConstructor)block
                      callback:(JSONCallback)callback
{
    return [self.apiClient POST:URLString
                     parameters:parameters
      constructingBodyWithBlock:block
                        success:[PinService successCallback:callback]
                        failure:[PinService failureCallback:callback]];
}

- (NSURLSessionDataTask *)DELETE:(NSString *)URLString
                      parameters:(NSDictionary *)parameters
                        callback:(JSONCallback)callback
{
    return [self.apiClient DELETE:URLString
                       parameters:parameters
                          success:[PinService successCallback:callback]
                          failure:[PinService failureCallback:callback]];

}

- (NSURLSessionDataTask *)PUT:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                     callback:(JSONCallback)callback
{
    return [self.apiClient PUT:URLString
                    parameters:parameters
                       success:[PinService successCallback:callback]
                       failure:[PinService failureCallback:callback]];

}



@end

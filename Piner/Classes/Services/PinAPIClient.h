//
//  PinAPIClient.h
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "AFHTTPSessionManager.h"


typedef void (^SuccessCallback) (NSURLSessionDataTask *task, id responseObject);
typedef void (^FailureCallback) (NSURLSessionDataTask *task, NSError *error);
typedef void (^FormDataConstructor) (id <AFMultipartFormData> formData);

@interface PinAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end

//
//  DPRequest.h
//  apidemo
//
//  Created by ZhouHui on 13-1-28.
//  Copyright (c) 2013年 Dianping. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DPAPI;


typedef void(^DPRequestCallback) (NSError *error, NSDictionary *result);

@interface DPRequest : NSObject

@property (nonatomic, unsafe_unretained) DPAPI *dpapi;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSDictionary *params;
@property (nonatomic, copy) DPRequestCallback callback;

+ (DPRequest *)requestWithURL:(NSString *)url
					   params:(NSDictionary *)params
					 callback:(DPRequestCallback)callback;


+ (NSString *)getParamValueFromUrl:(NSString*)url paramName:(NSString *)paramName;

+ (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params;

- (void)connect;

- (void)disconnect;

@end

//
//  DPAPI.m
//  apidemo
//
//  Created by ZhouHui on 13-1-28.
//  Copyright (c) 2013年 Dianping. All rights reserved.
//

#import "DPAPI.h"
#import "DPConstants.h"

@interface DPAPI (Private)

@end


@implementation DPAPI {
	NSMutableSet *requests;
}


+ (instancetype)shareAPI
{
    static dispatch_once_t onceToken;
    static DPAPI *api;
    dispatch_once(&onceToken, ^{
        api = [[DPAPI alloc] init];
    });
    return api;
}

- (id)init {
	self = [super init];
    if (self) {
        requests = [[NSMutableSet alloc] init];
    }
    return self;
}

- (DPRequest*)requestWithURL:(NSString *)url
					  params:(NSMutableDictionary *)params
					callback:(DPRequestCallback)callback
{
    if (params == nil) {
        params = [NSMutableDictionary dictionary];
    }
    
	NSString *fullURL = [kDPAPIDomain stringByAppendingString:url];
	
	DPRequest *_request = [DPRequest requestWithURL:fullURL
											 params:params
										   callback:callback];
	_request.dpapi = self;
	[requests addObject:_request];
	[_request connect];
	return _request;
}

- (DPRequest *)requestWithURL:(NSString *)url
				 paramsString:(NSString *)paramsString
                     callback:(DPRequestCallback)callback
{
	return [self requestWithURL:[NSString stringWithFormat:@"%@?%@", url, paramsString] params:nil callback:callback];
}


- (void)requestDidFinish:(DPRequest *)request
{
    [requests removeObject:request];
    request.dpapi = nil;
}

- (void)dealloc
{
    for (DPRequest* _request in requests)
    {
        _request.dpapi = nil;
    }
}

@end

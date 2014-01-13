//
//  DPAPI.h
//  apidemo
//
//  Created by ZhouHui on 13-1-28.
//  Copyright (c) 2013年 Dianping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPRequest.h"

#define kDPAppKey             @"581047837"
#define kDPAppSecret          @"cac47db2b55b4a5995f83e0398f70439"

#ifndef kDPAppKey
#error
#endif

#ifndef kDPAppSecret
#error
#endif

@interface DPAPI : NSObject


+ (instancetype)shareAPI;

- (DPRequest*)requestWithURL:(NSString *)url
					  params:(NSMutableDictionary *)params
					callback:(DPRequestCallback)callback;

- (DPRequest *)requestWithURL:(NSString *)url
				 paramsString:(NSString *)paramsString
                     callback:(DPRequestCallback)callback;


@end

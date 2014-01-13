//
//  DPService.h
//  Piner
//
//  Created by Gamy on 14-1-8.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DPAPI.h"


typedef void (^DPBusinessesCallback) (NSError *error, NSArray *businesses);

typedef void (^DPBusinessCallback) (NSError *error, Business *businesses);


@interface DPService : NSObject

//page 从 0 开始
+ (void)findNearbyBusinessesByKeyword:(NSString *)keyword
                             category:(NSString *)category
                                 page:(NSInteger)page
                             callback:(DPBusinessesCallback)callback;


+ (void)clearBusinessCacheData;
@end

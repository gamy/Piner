//
//  PinService+Auth.m
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "PinService.h"

@implementation PinService(Message)

- (NSURLSessionDataTask *)getNoticesWithPage:(NSInteger)page
                                    callback:(ListCallback)callback {
	return nil;
}

- (NSURLSessionDataTask *)getChatMessageWithFriend:(NSString *)uid
                                     beforeMessage:(NSString *)mid
                                          callback:(ListCallback)callback {
	return nil;
}

- (NSURLSessionDataTask *)getChatMessageWithFriend:(NSString *)uid
                                      afterMessage:(NSString *)mid
                                          callback:(ListCallback)callback {
	return nil;
}

@end

//
//  PinService+Auth.m
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "PinService.h"

@implementation PinService(Comment)

- (NSURLSessionDataTask *)getCommentsAtActivity:(NSString *)aid
                                           page:(NSInteger)page
                                       callback:(ListCallback)callback {
	return nil;
}

- (NSURLSessionDataTask *)getReceveiedComments:(NSString *)aid
                                          page:(NSInteger)page
                                      callback:(ListCallback)callback {
	return nil;
}

- (NSURLSessionDataTask *)createCommentAtActivity:(NSString *)aid
                                         callback:(ObjectCallback)callback {
	return nil;
}

- (NSURLSessionDataTask *)createReplyAtComment:(NSString *)cid
                                    atActivity:(NSString *)aid
                                      callback:(ObjectCallback)callback {
	return nil;
}


@end

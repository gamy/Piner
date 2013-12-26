//
//  PinService+Auth.m
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "PinService.h"

@implementation PinService(Relation)

- (NSURLSessionDataTask *)updateRelation:(NSString *)uid
                                  action:(RelationAction)action
                                callback:(SimpleCallback)callback {
	return nil;
}

- (NSURLSessionDataTask *)getFans:(NSString *)uid
                             page:(NSInteger)page
                         callback:(ListCallback)callback {
	return nil;
}

- (NSURLSessionDataTask *)getFollowers:(NSString *)uid
                                  page:(NSInteger)page
                              callback:(ListCallback)callback {
	return nil;
}
@end

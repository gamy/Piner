//
//  PinService+Auth.m
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "PinService.h"

@implementation PinService(Activity)

- (NSURLSessionDataTask *)deleteActivity:(NSString *)aid
                                callback:(SimpleCallback)callback{
	return nil;
}

- (NSURLSessionDataTask *)createActivity:(NSInteger)category
                                    info:(NSDictionary *)info
                                callback:(ObjectCallback)callback{
	return nil;
}

- (NSURLSessionDataTask *)updateActivity:(NSInteger)category
                                    info:(NSDictionary *)info
                                callback:(ObjectCallback)callback{
	return nil;
}

- (NSURLSessionDataTask *)getTimelineWithPage:(NSInteger)page
                                     callback:(ListCallback)callback{
	return nil;
}


- (NSURLSessionDataTask *)getActivity:(NSString *)aid
                             callback:(ObjectCallback)callback{
	return nil;
}


- (NSURLSessionDataTask *)updateActivity:(NSString *)aid
                                  action:(RelationAction)action
                                callback:(ObjectCallback)callback{
	return nil;
}

- (NSURLSessionDataTask *)getActivityFans:(NSString *)aid
                                     page:(NSInteger)page
                                 callback:(ListCallback)callback{
	return nil;
}

- (NSURLSessionDataTask *)getNearActivitiesWithPage:(NSInteger)page
                                           callback:(ListCallback)callback{
	return nil;
}


- (NSURLSessionDataTask *)getActivitiesWithCity:(NSString *)city
                                           page:(NSInteger)page
                                       callback:(ListCallback)callback{
	return nil;
}

- (NSURLSessionDataTask *)getActivitiesWithCity:(NSString *)city
                                       category:(NSInteger)category
                                           page:(NSInteger)page
                                       callback:(ListCallback)callback{
	return nil;
}

- (NSURLSessionDataTask *)searchActivitiesByKeyword:(NSString *)keyword
                                               page:(NSInteger)page
                                           callback:(ListCallback)callback{
	return nil;
}


- (NSURLSessionDataTask *)getUserJoinedActivitiesWithUid:(NSString *)uid
                                                    page:(NSInteger)page
                                                callback:(ListCallback)callback{
	return nil;
}

- (NSURLSessionDataTask *)getUserHostedActivitiesWithUid:(NSString *)uid
                                                    page:(NSInteger)page
                                                callback:(ListCallback)callback{
	return nil;
}



@end

//
//  PinService.h
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//



/*
 PUT - UPDATE
 POST - CREATE
 GET - GET
 DELETE - DELETE
*/

#import <Foundation/Foundation.h>
#import "PinAPIClient.h"
#import "PinModels.h"
#import "PinError.h"

typedef void (^SimpleCallback) (NSError *error);
typedef void (^ListCallback) (NSError *error, NSArray *list, BOOL hasMoreData);
typedef void (^ObjectCallback) (NSError *error, id object);

typedef void (^JSONCallback) (NSError *error, NSDictionary *jsonDict, NSArray *jsonList);

@interface PinService : NSObject
{
    @private
    __strong AFHTTPSessionManager *_client;
}

+ (instancetype)sharedService;
+ (instancetype)serviceWithAPIClinet:(AFHTTPSessionManager *)client;



- (AFHTTPSessionManager *)apiClient;

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                     callback:(JSONCallback)callback;

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
     constructingBodyWithBlock:(FormDataConstructor)block
                     callback:(JSONCallback)callback;

- (NSURLSessionDataTask *)DELETE:(NSString *)URLString
                      parameters:(NSDictionary *)parameters
                     callback:(JSONCallback)callback;

- (NSURLSessionDataTask *)PUT:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                     callback:(JSONCallback)callback;



@end

@interface PinService(Auth)

- (NSURLSessionDataTask *)signup:(NSString *)name
                        password:(NSString *)password
                        callback:(ObjectCallback)callback;

- (NSURLSessionDataTask *)signin:(NSString *)name
                        password:(NSString *)password
                        callback:(ObjectCallback)callback;

- (NSURLSessionDataTask *)logoutWithCallback:(SimpleCallback)callback;

@end

@interface PinService(User)

- (NSURLSessionDataTask *)getUser:(NSString *)uid
                         callback:(ObjectCallback)callback;

- (NSURLSessionDataTask *)updateUser:(NSString *)uid
                                info:(NSDictionary *)info
                            callback:(ObjectCallback)callback;

@end


typedef enum {
    RelationActionFollow = 1,
    RelationActionUnfollow = 2,
    RelationActionRemove = 3,
    RelationActionBlack = 4,
}RelationAction;



@interface PinService(Relation)


- (NSURLSessionDataTask *)updateRelation:(NSString *)uid
                                  action:(RelationAction)action
                                callback:(SimpleCallback)callback;

- (NSURLSessionDataTask *)getFans:(NSString *)uid
                             page:(NSInteger)page
                         callback:(ListCallback)callback;

- (NSURLSessionDataTask *)getFollowers:(NSString *)uid
                                  page:(NSInteger)page
                              callback:(ListCallback)callback;

@end


@interface PinService(Activity)

- (NSURLSessionDataTask *)deleteActivity:(NSString *)aid
                                callback:(SimpleCallback)callback;

- (NSURLSessionDataTask *)createActivity:(NSInteger)category
                                    info:(NSDictionary *)info
                                callback:(ObjectCallback)callback;

- (NSURLSessionDataTask *)updateActivity:(NSInteger)category
                                    info:(NSDictionary *)info
                                callback:(ObjectCallback)callback;

- (NSURLSessionDataTask *)getTimelineWithPage:(NSInteger)page
                                     callback:(ListCallback)callback;


- (NSURLSessionDataTask *)getActivity:(NSString *)aid
                             callback:(ObjectCallback)callback;


- (NSURLSessionDataTask *)updateActivity:(NSString *)aid
                                  action:(RelationAction)action
                                callback:(ObjectCallback)callback;

- (NSURLSessionDataTask *)getActivityFans:(NSString *)aid
                                     page:(NSInteger)page
                                 callback:(ListCallback)callback;

- (NSURLSessionDataTask *)getNearActivitiesWithPage:(NSInteger)page
                                           callback:(ListCallback)callback;


- (NSURLSessionDataTask *)getActivitiesWithCity:(NSString *)city
                                           page:(NSInteger)page
                                       callback:(ListCallback)callback;

- (NSURLSessionDataTask *)getActivitiesWithCity:(NSString *)city
                                       category:(NSInteger)category
                                           page:(NSInteger)page
                                       callback:(ListCallback)callback;

- (NSURLSessionDataTask *)searchActivitiesByKeyword:(NSString *)keyword
                                               page:(NSInteger)page
                                           callback:(ListCallback)callback;


- (NSURLSessionDataTask *)getUserJoinedActivitiesWithUid:(NSString *)uid
                                                    page:(NSInteger)page
                                                callback:(ListCallback)callback;

- (NSURLSessionDataTask *)getUserHostedActivitiesWithUid:(NSString *)uid
                                                    page:(NSInteger)page
                                                callback:(ListCallback)callback;


@end


@interface PinService(Comment)

- (NSURLSessionDataTask *)getCommentsAtActivity:(NSString *)aid
                                           page:(NSInteger)page
                                       callback:(ListCallback)callback;

- (NSURLSessionDataTask *)getReceveiedComments:(NSString *)aid
                                          page:(NSInteger)page
                                      callback:(ListCallback)callback;

- (NSURLSessionDataTask *)createCommentAtActivity:(NSString *)aid
                                         callback:(ObjectCallback)callback;

- (NSURLSessionDataTask *)createReplyAtComment:(NSString *)cid
                                    atActivity:(NSString *)aid
                                      callback:(ObjectCallback)callback;

@end


@interface PinService(Message)

- (NSURLSessionDataTask *)getNoticesWithPage:(NSInteger)page
                                    callback:(ListCallback)callback;

- (NSURLSessionDataTask *)getChatMessageWithFriend:(NSString *)uid
                                     beforeMessage:(NSString *)mid
                                          callback:(ListCallback)callback;

- (NSURLSessionDataTask *)getChatMessageWithFriend:(NSString *)uid
                                      afterMessage:(NSString *)mid
                                          callback:(ListCallback)callback;

@end


@interface PinService(Badge)

- (NSURLSessionDataTask *)getNewBadgeWithCallback:(ObjectCallback)callback;

@end

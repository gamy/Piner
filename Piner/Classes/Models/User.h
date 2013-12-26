//
//  User.h
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity, Comment, Contact, Location, User;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * avatar;
@property (nonatomic, retain) NSDate * birth;
@property (nonatomic, retain) NSNumber * fanCount;
@property (nonatomic, retain) NSNumber * followCount;
@property (nonatomic, retain) NSNumber * gender;
@property (nonatomic, retain) NSNumber * hostActivityCount;
@property (nonatomic, retain) NSString * introduce;
@property (nonatomic, retain) NSNumber * isLocalAccount;
@property (nonatomic, retain) NSNumber * joinActivityCount;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * nick;
@property (nonatomic, retain) NSString * oid;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSNumber * role;
@property (nonatomic, retain) NSString * signature;
@property (nonatomic, retain) NSDate * signupDate;
@property (nonatomic, retain) Contact *contact;
@property (nonatomic, retain) NSOrderedSet *fans;
@property (nonatomic, retain) NSOrderedSet *followers;
@property (nonatomic, retain) NSOrderedSet *hostedActivities;
@property (nonatomic, retain) NSOrderedSet *joinedActivities;
@property (nonatomic, retain) Location *location;
@property (nonatomic, retain) Comment *receivedComments;
@property (nonatomic, retain) NSOrderedSet *sentComments;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)insertObject:(User *)value inFansAtIndex:(NSUInteger)idx;
- (void)removeObjectFromFansAtIndex:(NSUInteger)idx;
- (void)insertFans:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeFansAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInFansAtIndex:(NSUInteger)idx withObject:(User *)value;
- (void)replaceFansAtIndexes:(NSIndexSet *)indexes withFans:(NSArray *)values;
- (void)addFansObject:(User *)value;
- (void)removeFansObject:(User *)value;
- (void)addFans:(NSOrderedSet *)values;
- (void)removeFans:(NSOrderedSet *)values;
- (void)insertObject:(User *)value inFollowersAtIndex:(NSUInteger)idx;
- (void)removeObjectFromFollowersAtIndex:(NSUInteger)idx;
- (void)insertFollowers:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeFollowersAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInFollowersAtIndex:(NSUInteger)idx withObject:(User *)value;
- (void)replaceFollowersAtIndexes:(NSIndexSet *)indexes withFollowers:(NSArray *)values;
- (void)addFollowersObject:(User *)value;
- (void)removeFollowersObject:(User *)value;
- (void)addFollowers:(NSOrderedSet *)values;
- (void)removeFollowers:(NSOrderedSet *)values;
- (void)insertObject:(Activity *)value inHostedActivitiesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromHostedActivitiesAtIndex:(NSUInteger)idx;
- (void)insertHostedActivities:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeHostedActivitiesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInHostedActivitiesAtIndex:(NSUInteger)idx withObject:(Activity *)value;
- (void)replaceHostedActivitiesAtIndexes:(NSIndexSet *)indexes withHostedActivities:(NSArray *)values;
- (void)addHostedActivitiesObject:(Activity *)value;
- (void)removeHostedActivitiesObject:(Activity *)value;
- (void)addHostedActivities:(NSOrderedSet *)values;
- (void)removeHostedActivities:(NSOrderedSet *)values;
- (void)insertObject:(Activity *)value inJoinedActivitiesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromJoinedActivitiesAtIndex:(NSUInteger)idx;
- (void)insertJoinedActivities:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeJoinedActivitiesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInJoinedActivitiesAtIndex:(NSUInteger)idx withObject:(Activity *)value;
- (void)replaceJoinedActivitiesAtIndexes:(NSIndexSet *)indexes withJoinedActivities:(NSArray *)values;
- (void)addJoinedActivitiesObject:(Activity *)value;
- (void)removeJoinedActivitiesObject:(Activity *)value;
- (void)addJoinedActivities:(NSOrderedSet *)values;
- (void)removeJoinedActivities:(NSOrderedSet *)values;
- (void)insertObject:(Comment *)value inSentCommentsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromSentCommentsAtIndex:(NSUInteger)idx;
- (void)insertSentComments:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeSentCommentsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInSentCommentsAtIndex:(NSUInteger)idx withObject:(Comment *)value;
- (void)replaceSentCommentsAtIndexes:(NSIndexSet *)indexes withSentComments:(NSArray *)values;
- (void)addSentCommentsObject:(Comment *)value;
- (void)removeSentCommentsObject:(Comment *)value;
- (void)addSentComments:(NSOrderedSet *)values;
- (void)removeSentComments:(NSOrderedSet *)values;
@end

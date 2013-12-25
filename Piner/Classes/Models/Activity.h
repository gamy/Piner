//
//  Activity.h
//  Piner
//
//  Created by Gamy on 13-12-25.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comment, Image, Location, User;

@interface Activity : NSManagedObject

@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * oId;
@property (nonatomic, retain) NSNumber * shopId;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSNumber * joinCount;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSNumber * maxNumber;
@property (nonatomic, retain) NSOrderedSet *guests;
@property (nonatomic, retain) User *host;
@property (nonatomic, retain) NSSet *images;
@property (nonatomic, retain) NSSet *comments;
@property (nonatomic, retain) Location *location;
@end

@interface Activity (CoreDataGeneratedAccessors)

- (void)insertObject:(User *)value inGuestsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromGuestsAtIndex:(NSUInteger)idx;
- (void)insertGuests:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeGuestsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInGuestsAtIndex:(NSUInteger)idx withObject:(User *)value;
- (void)replaceGuestsAtIndexes:(NSIndexSet *)indexes withGuests:(NSArray *)values;
- (void)addGuestsObject:(User *)value;
- (void)removeGuestsObject:(User *)value;
- (void)addGuests:(NSOrderedSet *)values;
- (void)removeGuests:(NSOrderedSet *)values;
- (void)addImagesObject:(Image *)value;
- (void)removeImagesObject:(Image *)value;
- (void)addImages:(NSSet *)values;
- (void)removeImages:(NSSet *)values;

- (void)addCommentsObject:(Comment *)value;
- (void)removeCommentsObject:(Comment *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

@end

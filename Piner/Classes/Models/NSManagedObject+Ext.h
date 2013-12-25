//
//  NSManagedObject+Ext.h
//  Piner
//
//  Created by Gamy on 13-12-21.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject(Ext)


@end


@interface MMManagedObject : NSManagedObject


+ (id)insertObject;

+ (id)insertObjectWithDict:(NSDictionary *)dict;

+ (id)objectForId:(NSString *)objectId;
+ (NSArray *)objects;
+ (NSArray *)objectsWithPredicate:(NSPredicate *)predicate;



+ (NSArray *)objectsWithPredicate:(NSPredicate *)predicate
                        sortByKey:(NSString *)key
                              asc:(BOOL)asc;

+ (NSArray *)objectsWithPredicate:(NSPredicate *)predicate
                        sortByKey:(NSString *)key
                              asc:(BOOL)asc
                           offset:(NSUInteger)offset
                            limit:(NSUInteger)limit;
+ (void)save;

+ (void)removeAllObjects;


+ (void)countWithPredicate:(NSPredicate *)predicate;

- (void)updateWithDict:(NSDictionary *)dict;

- (void)save;
- (void)remove;

@end
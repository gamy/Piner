//
//  NSManagedObject+Ext.m
//  Piner
//
//  Created by Gamy on 13-12-21.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "NSManagedObject+Ext.h"
#import "CoreDataManager.h"

@implementation NSManagedObject(Ext)


@end

CoreDataManager *coreDataManager;


@interface MMManagedObject()

@end


#define CDM [MMManagedObject coreDataManager]

@implementation MMManagedObject

+ (CoreDataManager *)coreDataManager
{
    if (coreDataManager == nil) {
        coreDataManager = [CoreDataManager defaultManager];
    }
    return coreDataManager;
}

+ (id)insertObject
{
    NSLog(@"<insertObject> class = %@",NSStringFromClass([self class]));
    
    NSString *name = NSStringFromClass([self class]);
    return [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:CDM.managedObjectContext];
}

//#define SET_VALUE(key, value) self.#key = value


- (SEL)selectorForField:(NSString *)field
{
    NSString *selStr = [NSString stringWithFormat:@"set%@:", field];
    SEL selector = NSSelectorFromString(selStr);
    return selector;
}

- (void)updateWithDict:(NSDictionary *)dict
{
    if (dict) {
        [dict enumerate:^(id key, id value) {
            if ([key isEqualToString:@"_id"]) {
                NSLog(@"change key from _id to objectId");
                key = @"objectId";
            }
            SEL selector = [self selectorForField:key];

            if (selector != NULL && [self respondsToSelector:selector]) {
                [self performSelector:selector withObject:value];
            }else{
                NSLog(@"%@ has no attibute: %@", [[self class] entityName], key);
            }
        }];
    }
}

+ (id)insertObjectWithDict:(NSDictionary *)dict
{
    MMManagedObject *obj = [self insertObject];
    [obj updateWithDict:dict];
    return obj;
}

+ (NSString *)entityName
{
    return NSStringFromClass([self class]);
}

+ (NSArray *)objects
{
    return [self objectsWithPredicate:nil];
}


+ (NSArray *)objectsWithPredicate:(NSPredicate *)predicate
{
    return [self objectsWithPredicate:predicate sortByKey:nil asc:YES];
}

+ (NSArray *)objectsWithPredicate:(NSPredicate *)predicate
                        sortByKey:(NSString *)key
                              asc:(BOOL)asc
{
    return [self objectsWithPredicate:predicate sortByKey:key asc:asc offset:0 limit:0];
}


+ (NSArray *)objectsWithPredicate:(NSPredicate *)predicate
                        sortByKey:(NSString *)key
                              asc:(BOOL)asc
                           offset:(NSUInteger)offset
                            limit:(NSUInteger)limit
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:[self entityName] inManagedObjectContext:CDM.managedObjectContext]];
    if (predicate) {
        [fetchRequest setPredicate:predicate];
    }
    if ([key length] != 0) {
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:key ascending:asc];
        [fetchRequest setSortDescriptors:@[sort]];
    }
    if (limit > 0) {
        [fetchRequest setFetchOffset:offset];
        [fetchRequest setFetchLimit:limit];
    }

    
    NSError *error = nil;
    NSArray *array = [CDM.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"Error : %@\n", [error localizedDescription]);
    }
    NSLog(@"array count = %d", [array count]);
    return array;
}


+ (id)objectForId:(NSString *)objectId
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"objectId = %@", objectId];
    NSArray *objects = [self objectsWithPredicate:predicate];
    if ([objects count] > 0) {
        return objects[0];
    }
    return nil;
}


+ (void)save
{
    NSError *error = nil;
    [CDM.managedObjectContext save:&error];
    NSLog(@"error = %@",error);
}

+ (void)removeAllObjects
{
    NSArray *objs = [self objects];
    NSLog(@"%d objs to be deleted", [objs count]);
    for (MMManagedObject *obj in objs) {
        [obj remove];
    }
    [self save];
}

+ (void)countWithPredicate:(NSPredicate *)predicate
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:[self entityName] inManagedObjectContext:CDM.managedObjectContext]];
    if (predicate) {
        [fetchRequest setPredicate:predicate];
    }

    NSError *error = nil;
    NSInteger count = [CDM.managedObjectContext countForFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"an error happended. error = %@", error);
        return 0;
    }
    return count;
}

- (void)save
{
    [MMManagedObject save];
}

- (void)remove
{
    [CDM.managedObjectContext deleteObject:self];
}

@end
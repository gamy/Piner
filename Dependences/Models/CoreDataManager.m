//
//  CoreDataManager.m
//  Piner
//
//  Created by Gamy on 13-12-21.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "CoreDataManager.h"


@interface CoreDataManager()
{
    NSManagedObjectContext *_managedObjectContext;
    NSManagedObjectModel *_managedObjectModel;
    NSPersistentStoreCoordinator *_persistentStoreCoordinator;
    
}
@end

@implementation CoreDataManager


+ (id)defaultManager
{
    static dispatch_once_t onceToken;
    static CoreDataManager *_coreDataManager;
    dispatch_once(&onceToken, ^{
        _coreDataManager = [[CoreDataManager alloc] init];

    });
    return _coreDataManager;
}

- (void)setup
{
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    _managedObjectContext = [[NSManagedObjectContext alloc] init];

    NSString *storeType = NSSQLiteStoreType;
    NSString *storeName = @"piner.sqlite";
    
    NSError *error = NULL;
    NSURL *storeURL = [NSURL fileURLWithPath:[[MMFileManager appDocumentsDirectory] stringByAppendingPathComponent:storeName]];
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:storeType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Error : %@\n", [error localizedDescription]);
        NSAssert1(YES, @"Failed to create store %@ with NSSQLiteStoreType", [storeURL path]);
    }
    
    [_managedObjectContext setPersistentStoreCoordinator:_persistentStoreCoordinator];
}

- (id)init
{
   self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (NSManagedObjectContext *)managedObjectContext
{
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    return _managedObjectModel;
}

@end

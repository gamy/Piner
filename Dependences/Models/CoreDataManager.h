//
//  CoreDataManager.h
//  Piner
//
//  Created by Gamy on 13-12-21.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

- (NSManagedObjectModel *)managedObjectModel;
- (NSManagedObjectContext *)managedObjectContext;
+ (id)defaultManager;
@end

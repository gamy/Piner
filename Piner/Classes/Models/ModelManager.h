//
//  ModelManager.h
//  Piner
//
//  Created by Gamy on 14-1-7.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PinModels.h"

@interface ModelManager : NSObject
@property(nonatomic, strong)NSManagedObjectContext *context;

+ (Activity *)genActivity;

+ (NSArray *)genActivityList:(NSInteger)count;



+ (id)backgroundManager;
+ (id)mainManager;
+ (id)managerWithContext:(NSManagedObjectContext *)context;


- (User *)parseUserWithJson:(NSDictionary *)json;
- (Activity *)parseActivityWithJson:(NSDictionary *)json;
- (Message *)parseMessageWithJson:(NSDictionary *)json;
- (Comment *)parseCommentWithJson:(NSDictionary *)json;

@end

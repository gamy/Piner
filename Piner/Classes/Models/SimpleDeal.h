//
//  SimpleDeal.h
//  Piner
//
//  Created by Gamy on 14-1-9.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Business;

@interface SimpleDeal : NSManagedObject

@property (nonatomic, retain) NSString * deal_id;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) Business *bussiness;

@end

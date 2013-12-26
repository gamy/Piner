//
//  Badge.h
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Badge : NSManagedObject

@property (nonatomic, retain) NSNumber * fanCount;
@property (nonatomic, retain) NSNumber * messageCount;
@property (nonatomic, retain) NSNumber * commentCount;
@property (nonatomic, retain) NSNumber * noticeCount;
@property (nonatomic, retain) NSNumber * invitationCount;

@end

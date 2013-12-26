//
//  Sound.h
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Message;

@interface Sound : NSManagedObject

@property (nonatomic, retain) NSNumber * seconds;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) Message *message;

@end

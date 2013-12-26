//
//  Message.h
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Image, Sound;

@interface Message : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * createDate;
@property (nonatomic, retain) NSString * oid;
@property (nonatomic, retain) NSNumber * read;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) Image *image;
@property (nonatomic, retain) Sound *sound;

@end

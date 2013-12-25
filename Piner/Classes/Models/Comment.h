//
//  Comment.h
//  Piner
//
//  Created by Gamy on 13-12-25.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Message.h"

@class Activity, Comment, User;

@interface Comment : Message

@property (nonatomic, retain) User *author;
@property (nonatomic, retain) Comment *replyTarget;
@property (nonatomic, retain) Activity *activity;

@end

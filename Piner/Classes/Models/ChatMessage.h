//
//  ChatMessage.h
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Message.h"

@class User;

@interface ChatMessage : Message

@property (nonatomic, retain) User *receiver;
@property (nonatomic, retain) User *sender;

@end

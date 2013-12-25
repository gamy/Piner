//
//  ChatMessage.h
//  Piner
//
//  Created by Gamy on 13-12-25.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Message.h"

@class User;

@interface ChatMessage : Message

@property (nonatomic, retain) User *sender;
@property (nonatomic, retain) User *receiver;

@end

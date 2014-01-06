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

+ (Activity *)genActivity;

+ (NSArray *)genActivityList:(NSInteger)count;

@end

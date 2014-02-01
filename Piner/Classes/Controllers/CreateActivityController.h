//
//  CreateActivityController.h
//  Piner
//
//  Created by Gamy on 14-1-15.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "MMViewController.h"

@interface CreateActivityController : MMViewController

+ (instancetype)controllerWithType:(PinType)type;
- (PinType)type;


@end

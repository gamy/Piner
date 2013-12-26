//
//  PinError.h
//  Piner
//
//  Created by Gamy on 13-12-26.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PinError : NSObject

+ (NSError *)errorWithCode:(NSInteger)code message:(NSString *)message;

@end

//
//  StringUtils.h
//  Piner
//
//  Created by Gamy on 13-12-29.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSString(Validate)

- (BOOL)isValidAccount;

//return error string.
- (NSString *)checkMinLength:(NSUInteger)minLength
                   maxLength:(NSUInteger)maxLength;


@end

//
//  Contact.h
//  Piner
//
//  Created by Gamy on 13-12-25.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * sinaWeiboId;
@property (nonatomic, retain) NSString * qqWeiboId;
@property (nonatomic, retain) NSString * weixin;
@property (nonatomic, retain) NSString * qqNumber;
@property (nonatomic, retain) NSString * email;

@end

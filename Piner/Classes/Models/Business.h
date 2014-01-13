//
//  Business.h
//  Piner
//
//  Created by Gamy on 14-1-9.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SimpleDeal;

@interface Business : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSNumber * avg_price;
@property (nonatomic, retain) NSNumber * avg_rating;
@property (nonatomic, retain) NSString * branch_name;
@property (nonatomic, retain) NSNumber * business_id;
@property (nonatomic, retain) NSString * categories;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSNumber * decoration_grade;
@property (nonatomic, retain) NSNumber * decoration_score;
@property (nonatomic, retain) NSNumber * distance;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * product_grade;
@property (nonatomic, retain) NSNumber * product_score;
@property (nonatomic, retain) NSString * rating_img_url;
@property (nonatomic, retain) NSString * rating_s_img_url;
@property (nonatomic, retain) NSString * regions;
@property (nonatomic, retain) NSNumber * review_count;
@property (nonatomic, retain) NSNumber * service_grade;
@property (nonatomic, retain) NSNumber * service_score;
@property (nonatomic, retain) NSString * telephone;
@property (nonatomic, retain) NSString * business_url;
@property (nonatomic, retain) NSString * photo_url;
@property (nonatomic, retain) NSString * s_photo_url;
@property (nonatomic, retain) NSNumber * has_coupon;
@property (nonatomic, retain) NSNumber * coupon_id;
@property (nonatomic, retain) NSString * coupon_description;
@property (nonatomic, retain) NSString * coupon_url;
@property (nonatomic, retain) NSNumber * has_deal;
@property (nonatomic, retain) NSNumber * deal_count;
@property (nonatomic, retain) NSNumber * has_online_reservation;
@property (nonatomic, retain) NSString * online_reservation_url;
@property (nonatomic, retain) NSSet *deals;
@end

@interface Business (CoreDataGeneratedAccessors)

- (void)addDealsObject:(SimpleDeal *)value;
- (void)removeDealsObject:(SimpleDeal *)value;
- (void)addDeals:(NSSet *)values;
- (void)removeDeals:(NSSet *)values;

@end

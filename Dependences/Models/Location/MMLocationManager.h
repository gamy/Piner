//
//  MMLocationManager.h
//  Piner
//
//  Created by Gamy on 14-1-12.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <CoreLocation/CLGeocoder.h>

@import CoreLocation.CLLocationManager;
@import CoreLocation.CLLocation;
@import CoreLocation.CLLocationManagerDelegate;
@import CoreLocation.CLPlacemark;
@import CoreLocation.CLGeocoder;


#ifndef UPDATE_LOCATION_NOTIFICATION

#define UPDATE_LOCATION_NOTIFICATION @"UPDATE_LOCATION_NOTIFICATION"
#define UPDATE_LOCATION_NOTIFICATION_FAILED @"UPDATE_LOCATION_NOTIFICATION_FAILED"

#endif

//CLGeocoder
@interface MMLocationManager : NSObject<CLLocationManagerDelegate>

@property(nonatomic, copy)NSString *country;
@property(nonatomic, copy)NSString *province;
@property(nonatomic, copy)NSString *city;
@property(nonatomic, copy)NSString *region;


+ (instancetype)defaultManager;
- (void)syncLoaction;
- (CLLocationCoordinate2D)coordinate;
- (CLLocation*)location;

- (void)registerObserver:(id)observer handler:(SEL)handler;
- (void)unregisterObserver:(id)observer;

@end

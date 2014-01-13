//
//  MMLocationManager.m
//  Piner
//
//  Created by Gamy on 14-1-12.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "MMLocationManager.h"



@interface MMLocationManager()

@property(nonatomic, strong)CLLocationManager *locationManager;

@end




@implementation MMLocationManager

- (void)registerObserver:(id)observer handler:(SEL)handler
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:handler name:UPDATE_LOCATION_NOTIFICATION object:self];
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:handler name:UPDATE_LOCATION_NOTIFICATION_FAILED object:self];

}
- (void)unregisterObserver:(id)observer
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:UPDATE_LOCATION_NOTIFICATION object:self];
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:UPDATE_LOCATION_NOTIFICATION_FAILED object:self];
    
}


+ (CLLocationManager *)defaultLocationManager
{
    static dispatch_once_t onceToken;
    static CLLocationManager *_staticLocationManager;
    dispatch_once(&onceToken, ^{
        _staticLocationManager = [[CLLocationManager alloc] init];
    });
    return _staticLocationManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.locationManager = [MMLocationManager defaultLocationManager];
        self.locationManager.delegate = self;
        [self.locationManager startUpdatingLocation];
    }
    return self;
}

+ (instancetype)defaultManager
{
    static dispatch_once_t onceToken;
    static MMLocationManager *_staticMMLocationManager;
    dispatch_once(&onceToken, ^{
        _staticMMLocationManager = [[MMLocationManager alloc] init];
    });
    return _staticMMLocationManager;
}

- (void)syncLoaction
{
    NSLog(@"start to sync Location");
    [self.locationManager startUpdatingLocation];
}

- (void)updateCityWithLocation:(CLLocation *)location
{
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (error) {
             NSLog(@"error: %@",error.description);
         }
         else{
             NSLog(@"placemarks count %d",placemarks.count);
             for (CLPlacemark *placeMark in placemarks)
             {
                 NSLog(@"地址name:%@ ",placeMark.name);
                 NSLog(@"地址thoroughfare:%@",placeMark.thoroughfare);
                 NSLog(@"地址subThoroughfare:%@",placeMark.subThoroughfare);
                 NSLog(@"地址locality:%@",placeMark.locality);
                 NSLog(@"地址subLocality:%@",placeMark.subLocality);
                 NSLog(@"地址administrativeArea:%@",placeMark.administrativeArea);
                 NSLog(@"地址subAdministrativeArea:%@",placeMark.subAdministrativeArea);
                 NSLog(@"地址postalCode:%@",placeMark.postalCode);
                 NSLog(@"地址ISOcountryCode:%@",placeMark.ISOcountryCode);
                 NSLog(@"地址country:%@",placeMark.country);
                 NSLog(@"地址inlandWater:%@",placeMark.inlandWater);
                 NSLog(@"地址ocean:%@",placeMark.ocean);
                 NSLog(@"地址areasOfInterest:%@",placeMark.areasOfInterest);
                 
                 self.city = placeMark.locality;
                 self.region = placeMark.subLocality;
                 self.country = placeMark.country;
//                 self.province = placeMark.
             }
         }
         
     }];
}

- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations
{
    NSLog(@"location count = %d", [locations count]);
    CLLocation *location = [locations lastObject];
    NSLog(@"last location = (%f, %f)", location.coordinate.latitude, location.coordinate.longitude);
    
    //find the city name
    [self updateCityWithLocation:location];
 
    [[NSNotificationCenter defaultCenter] postNotificationName:UPDATE_LOCATION_NOTIFICATION object:self];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"error = %@", error);
    [[NSNotificationCenter defaultCenter] postNotificationName:UPDATE_LOCATION_NOTIFICATION_FAILED object:self userInfo:@{@"message":@"定位失败"}];

}

- (CLLocationCoordinate2D)coordinate
{
    return [self.location coordinate];
}
- (CLLocation*)location
{
    return [self.locationManager location];
}

@end

//
//  DPService.m
//  Piner
//
//  Created by Gamy on 14-1-8.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "DPService.h"
#import "DPAPI.h"



#define FIND_BUSINESS_URL @"v1/business/find_businesses"
//urlArray = [NSArray arrayWithObjects:@"v1/business/find_businesses"
//            , @"v1/deal/find_deals"
//            , @"v1/deal/get_single_deal"
//            , @"v1/review/get_recent_reviews"
//            , nil];

@implementation DPService

+ (SimpleDeal *)parseSimpleDeal:(NSDictionary *)dict
{
    if ([dict isKindOfClass:[NSDictionary class]]) {
        SimpleDeal *deal = [SimpleDeal insertInContext:[NSManagedObjectContext mainContext]];
        deal.desc = dict[@"description"];
        deal.url = dict[@"url"];
        deal.deal_id = dict[@"id"];
        return deal;
    }
    return nil;
}

+ (NSSet *)parseSimpleDeals:(NSArray *)list
{
    if (list && [list isKindOfClass:[NSArray class]]) {
        NSMutableSet *ret = [NSMutableSet set];
        for (NSDictionary *dict in list) {
            SimpleDeal *deal = [self parseSimpleDeal:dict];
            NSLog(@"deal_id = %@, url =%@", deal.deal_id, deal.url);
            if (deal) {
                [ret addObject:deal];
            }
        }
        return ret;
    }
    return nil;
}

+ (NSString *)parseRegions:(NSArray *)list
{
    if ([list isKindOfClass:[NSArray class]] && [list count] > 0) {
        
        if ([list count] > 1) {
            NSInteger len = MAX([list count] - 1, 1);
            list = [list subarrayWithRange:NSMakeRange(1, len)];
        }
        return [list componentsJoinedByString:@"/"];
    }
    return nil;
}

+ (NSString *)parseCategories:(NSArray *)list
{
    if ([list isKindOfClass:[NSArray class]] && [list count] > 0) {
        
        if ([list count] > 1) {
            NSInteger len = 2;
            list = [list subarrayWithRange:NSMakeRange(0, len)];
        }
        return [list componentsJoinedByString:@"/"];
    }
    return nil;
}

+ (NSArray *)parseBusinesses:(NSArray *)list
{
    NSLog(@"list count = %d", [list count]);
    NSMutableArray *ret = [NSMutableArray array];
    for (NSDictionary *dict in list) {
        if ([dict isKindOfClass:[NSDictionary class]]) {
            Business *business = [Business insertInContext:[NSManagedObjectContext mainContext]];
            [business populateWithDictionary:dict];
            business.regions = [self parseRegions:dict[@"regions"]];
            business.categories = [self parseCategories:dict[@"categories"]];
            NSLog(@"address = %@", [business address]);
            NSSet *deals = [self parseSimpleDeals:dict[@"deals"]];
            if ([deals count] > 0) {
                [business setDeals:deals];
            }
            [ret addObject:business];
        }
    }
    return ret;
}


+ (void)findNearbyBusinessesByKeyword:(NSString *)keyword
                             category:(NSString *)category
                                 page:(NSInteger)page
                             callback:(DPBusinessesCallback)callback;
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//    params[@"city"] = @"北京";
//    params[@"region"] = @"西城区";
//    params[@"latitude"] = @(23.127948);
//    params[@"longitude"] = @(113.277422);
    
    params[@"latitude"] = @(23.131);
    params[@"longitude"] = @(113.272);
    params[@"radius"] = @(5000);
    
    params[@"sort"] = @(7);
    params[@"limit"] = @(20);
    params[@"page"] = @(page+1);
    if(category) params[@"category"] = category;
    if(keyword) params[@"keyword"] = keyword;
    
    DPRequestCallback handler = ^(NSError *error, NSDictionary *result) {
        NSArray *businesses = nil;
        if (!error) {
            NSArray *list = result[@"businesses"];
            businesses = [self parseBusinesses:list];
        }
        if (callback != NULL) {
            callback(error, businesses);
        }
    };
    
    [[DPAPI shareAPI] requestWithURL:FIND_BUSINESS_URL
                              params:params
                            callback:handler];
}

+ (void)clearBusinessCacheData
{
    NSInteger count = [Business countInContext:[NSManagedObjectContext mainContext] predicate:nil];

    NSLog(@"before clearBusinessCacheData, count = %d", count);
    [Business deleteInContext:[NSManagedObjectContext mainContext] predicate:nil];
    
    count = [Business countInContext:[NSManagedObjectContext mainContext] predicate:nil];
    NSLog(@"after clearBusinessCacheData, count = %d", count);
}

@end

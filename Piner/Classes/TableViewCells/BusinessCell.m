//
//  BusinessCell.m
//  Piner
//
//  Created by Gamy on 14-1-9.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "BusinessCell.h"
#import "UIImageView+Ext.h"
#import "NSString+Ext.h"

@interface BusinessCell()
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardLabel;
@property (weak, nonatomic) IBOutlet UILabel *dealLabel;
@property (weak, nonatomic) IBOutlet UIImageView *rateImageView;
@property (weak, nonatomic) IBOutlet UILabel *costLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@end

@implementation BusinessCell

- (void)setup
{
    
}
+ (CGFloat)heightForItem:(id)item
{
    return 80;
}

- (NSString *)distanceStringForBusiness:(Business *)business
{
    NSInteger dis = [business.distance integerValue];
    if (dis >= 1000) {
        return [NSString stringWithFormat:@"%.1f km",dis/1000.0];
    }else if(dis >= 0){
        return [NSString stringWithFormat:@"%d m",dis];
    }else{
        return nil;
    }
}


- (NSString *)priceStringForBusiness:(Business *)business
{
    NSInteger price = [business.avg_price integerValue];
    if (price > 0) {
        return [NSString stringWithFormat:@"人均:￥%d", price];
    }else{
        return nil;
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    Business *business = (id)self.item;
    [self.photoView setImageWithURL:[business.photo_url URL] placeholderImage:nil animated:YES];
    [self.rateImageView setImageWithURL:[business.rating_s_img_url URL] placeholderImage:nil animated:YES];
    [self.nameLabel setText:business.name];
    [self.dealLabel setHidden:![business.has_deal boolValue]];
    [self.cardLabel setHidden:![business.has_coupon boolValue]];
    
    [self.distanceLabel setText:[business.distance stringValue]];
    NSString *info = [NSString stringWithFormat:@"%@  %@", business.regions, business.categories];
    [self.infoLabel setText:info];
    
    [self.costLabel setText:[self priceStringForBusiness:business]];
    [self.distanceLabel setText:[self distanceStringForBusiness:business]];
}

@end

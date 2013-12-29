//
//  MMActivityView.h
//  Piner
//
//  Created by Gamy on 13-12-28.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMActivityView : UIView

@property(nonatomic, assign)BOOL hasMask;
@property(nonatomic, copy)NSString *text;

+ (instancetype)activityView;
- (void)showInView:(UIView *)view;
- (void)dismiss;


@end

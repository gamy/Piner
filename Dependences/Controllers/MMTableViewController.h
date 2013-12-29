//
//  MMTableViewController.h
//  Piner
//
//  Created by Gamy on 13-12-19.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Ext.h"

//typedef void(^ LoadDataCallback) (NSError *error, id data);

@interface MMTableViewController : UITableViewController


@property(assign, nonatomic, readonly, getter = isLoading) BOOL loading;

//call to refresh the data.
- (void)startRefreshing;

// should be override.
- (void)startToReloadData;

- (void)startToLoadMoreData;

// called by sub classes
- (void)finishLoadMoreData;
- (void)finishReloadData;

- (void)showActivityWithText:(NSString *)text;
- (void)showActivity;
- (void)endActivity;


@end

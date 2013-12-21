//
//  MMTableViewController.h
//  Piner
//
//  Created by Gamy on 13-12-19.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

//typedef void(^ LoadDataCallback) (NSError *error, id data);

@interface MMTableViewController : UITableViewController<MJRefreshBaseViewDelegate>


//call to refresh the data.
- (void)beginRefreshing;

//TODO should be override.
- (void)startToReloadData;
- (void)finishReloadData;

- (void)startToLoadMoreData;
- (void)finishLoadMoreData;



@end

//
//  MMTableViewController.h
//  Piner
//
//  Created by Gamy on 13-12-19.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Ext.h"
#import "UIViewController+Search.h"

//typedef void(^ LoadDataCallback) (NSError *error, id data);

@interface MMTableViewController : UITableViewController
{
    @protected
    NSMutableArray *_dataList;
    BOOL _loading;
    NSURLSessionTask *_loadDataTask;
    NSInteger _page;
}

@property(nonatomic, assign)BOOL hasMoreData;


- (void)disablePullRefresh;

- (NSArray *)dataList;

//Must be MMTableView subclass!!
- (Class)tableViewCellClassAtIndexPath:(NSIndexPath *)indexPath;

@end



@interface MMTableViewController(LoadData)
//call to refresh the data.
- (void)startRefreshing;

// should be override.
- (void)startToReloadData;
- (void)startToLoadMoreData;
- (void)cancelLoadDataTask;

// called by sub classes
- (void)finishLoadMoreData:(NSArray *)list;
- (void)finishReloadData:(NSArray *)list;
- (void)failToLoadData:(NSError *)error;

- (BOOL)isLoading;

- (NSInteger)nextPage;

@end


@interface MMTableViewController(Activity)

- (void)showActivityWithText:(NSString *)text;
- (void)showActivity;
- (void)endActivity;

@end


@interface MMTableViewController(CRUD)

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)indexPathOfItem:(id)item;
- (void)addItem:(id)item;
- (void)deleteItem:(id)item;
- (void)deleteItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)replaceItem:(id)item atIndexPath:(NSIndexPath *)indexPath;
@end


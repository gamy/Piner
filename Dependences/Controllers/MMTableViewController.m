//
//  MMTableViewController.m
//  Piner
//
//  Created by Gamy on 13-12-19.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "MMTableViewController.h"
#import "MMActivityView.h"
#import "LeoLoadingView.h"
#import "MMTableViewCell.h"

@interface MMTableViewController ()

@property(nonatomic, weak) MMActivityView *loadingView;
@property(nonatomic, weak) LeoLoadingView *lhLoadingView;
@property(nonatomic, assign) BOOL useLHLoadingView;
@end

@implementation MMTableViewController



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

//load data

- (void)startToReloadData:(id)refreshControl
{
    if (!self.isLoading) {
        [[self refreshControl] beginRefreshing];
        _loading = YES;
        [self startToReloadData];
    }else{
        [self.refreshControl endRefreshing];
        NSLog(@"isLoading, Can't start to load data.");
    }
}


- (void)setupRefreshViews
{
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(startToReloadData:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl.attributedTitle = nil;
    
}



- (void)viewDidLoad
{
    _dataList = [NSMutableArray array];
    self.useLHLoadingView = YES;
    [super viewDidLoad];
    [self setupRefreshViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)dataList
{
    return _dataList;
}


- (Class)tableViewCellClassAtIndexPath:(NSIndexPath *)indexPath
{
    return [MMTableViewCell class];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return [_dataList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath];
    if (indexPath.row == 9) {
        NSLog(@"stop here!!!");
    }
    Class cellClass = [self tableViewCellClassAtIndexPath:indexPath];
    CGFloat height = [cellClass heightForItem:item];
    NSLog(@"index = %d, cell class = %@, height = %f", indexPath.row, NSStringFromClass(cellClass), height);
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class cellClass = [self tableViewCellClassAtIndexPath:indexPath];
    NSString *CellIdentifier = [cellClass identifier];
    MMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [cellClass cell];
    }
    [cell setItem:[self itemAtIndexPath:indexPath]];
    cell.indexPath = indexPath;
    cell.delegate = self;
    return cell;
}



- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate) {
        if ((scrollView.contentOffset.y + CGRectGetHeight(scrollView.frame)) >= scrollView.contentSize.height && !self.isLoading){
            _loading = YES;
            [self startToLoadMoreData];
        }
    }
}


@end


@implementation MMTableViewController(LoadData)


- (void)startRefreshing
{
    [self.refreshControl beginRefreshing];
    [self.refreshControl sendActionsForControlEvents:UIControlEventValueChanged];
    [self.tableView setContentOffset:CGPointMake(0, -75) animated:YES];
}


- (void)startToReloadData
{
    NSLog(@"show Activity for reload data!!");
    [self showActivityWithText:@"加载中..."];
    NSLog(@"startToReloadData");
}

- (void)startToLoadMoreData
{
    NSLog(@"show Activity for load more data!!");
    [self showActivityWithText:@"加载中..."];
    NSLog(@"<startToLoadMoreData>");
}


- (void)finishReloadData:(NSArray *)list
{
    [self endActivity];
    NSLog(@"finishReloadData");
    [self.refreshControl endRefreshing];
    self.refreshControl.attributedTitle = nil;
    _loading = NO;
    if (list) {
        [_dataList removeAllObjects];
        [_dataList addObjectsFromArray:list];
        [self.tableView reloadData];
    }
}


- (void)finishLoadMoreData:(NSArray *)list
{
    [self endActivity];
    NSLog(@"finishLoadMoreData");
    _loading = NO;
    if (list) {
        [_dataList addObjectsFromArray:list];
        [self.tableView reloadData];
    }
}

- (void)failToLoadData:(NSError *)error
{
     NSLog(@"failToLoadData, error = %@", error);
}

- (void)cancelLoadDataTask
{
    [_loadDataTask cancel];
    [self endActivity];
    [self.refreshControl endRefreshing];
}

- (BOOL)isLoading
{
    return _loading;
}


@end



@implementation MMTableViewController(Activity)

//activity

- (void)showActivityWithText:(NSString *)text
{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    if (self.useLHLoadingView) {
        LeoLoadingView *ll = self.lhLoadingView;
        if (ll == nil) {
            ll = [[LeoLoadingView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
            self.lhLoadingView = ll;
        }
        [keyWindow addSubview:ll];
        ll.center = keyWindow.center;
        [ll showView:YES];
    }else{
        MMActivityView *ai = self.loadingView;
        if (self.loadingView == nil) {
            ai = [MMActivityView activityView];
            self.loadingView = ai;
        }
        [self.loadingView setText:text];
        self.loadingView.hasMask = YES;
        [self.loadingView showInView:keyWindow];
        [self.loadingView updateCenterY:180];
    }
}

- (void)showActivity
{
    [self showActivityWithText:nil];
}

- (void)endActivity
{
    if (self.useLHLoadingView) {
        [self.lhLoadingView showView:NO];
    }else{
        [self.loadingView dismiss];
    }
}

@end


@implementation MMTableViewController(CRUD)

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath == nil) {
        return nil;
    }
    if (indexPath.row < [_dataList count]) {
        return _dataList[indexPath.row];
    }
    return nil;
}

- (NSIndexPath *)indexPathOfItem:(id)item
{
    if (item == nil) {
        return nil;
    }
    NSUInteger index = [_dataList indexOfObject:item];
    if (index != NSNotFound) {
        return [NSIndexPath indexPathForRow:index inSection:0];
    }
    return nil;
}

- (void)addItem:(id)item
{
    if (item) {
        [_dataList addObject:item];
        NSIndexPath *indexPath = [self indexPathOfItem:item];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
- (void)deleteItem:(id)item
{
    NSIndexPath *indexPath = [self indexPathOfItem:item];
    [self deleteItemAtIndexPath:indexPath];
}
- (void)deleteItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath) {
        id item = [self itemAtIndexPath:indexPath];
        if (item) {
            [self.dataList delete:item];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    }
}

- (void)replaceItem:(id)item atIndexPath:(NSIndexPath *)indexPath
{
    id oldItem = [self itemAtIndexPath:indexPath];
    if (oldItem) {
        NSUInteger index = [self indexPathOfItem:oldItem];
        if (index != NSNotFound && item) {
            [_dataList replaceObjectAtIndex:index withObject:item];
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    }

}
@end

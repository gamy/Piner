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

- (void)setupRefreshViews
{
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(startToReloadData:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl.attributedTitle = nil;
    
}



- (void)viewDidLoad
{
    self.useLHLoadingView = YES;
    [super viewDidLoad];
    [self setupRefreshViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"Row %d", indexPath.row]];

    return cell;
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

- (void)startToReloadData
{
    NSLog(@"show Activity for reload data!!");
    [self showActivityWithText:@"加载中..."];
    NSLog(@"startToReloadData");
}
- (void)finishReloadData
{
    [self endActivity];
    NSLog(@"finishReloadData");
    [self.refreshControl endRefreshing];
    self.refreshControl.attributedTitle = nil;
    _loading = NO;
}

- (void)startToLoadMoreData
{
    NSLog(@"show Activity for load more data!!");
    [self showActivityWithText:@"加载中..."];
    NSLog(@"<startToLoadMoreData>");
}
- (void)finishLoadMoreData
{
    [self endActivity];
    NSLog(@"finishLoadMoreData");
    _loading = NO;
}

- (void)startRefreshing
{
    [self.refreshControl beginRefreshing];
    [self.refreshControl sendActionsForControlEvents:UIControlEventValueChanged];
    [self.tableView setContentOffset:CGPointMake(0, -75) animated:YES];
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

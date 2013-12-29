//
//  TimelineController.m
//  Piner
//
//  Created by Gamy on 13-12-19.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "TimelineController.h"

@interface TimelineController ()
{
    NSInteger rowCount;
}
@end

@implementation TimelineController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        rowCount = 10;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    rowCount = 10;
    [self startRefreshing];
    [SignController presentFromController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return rowCount;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [SignController presentFromController:self];
}


- (void)finishReloadData
{
    rowCount = 10;
    [super finishReloadData];
    [self.tableView reloadData];
}

- (void)finishLoadMoreData
{
    rowCount += 10;
    [super finishLoadMoreData];
    [self.tableView reloadData];
}

- (void)startToReloadData
{
    [super startToReloadData];
    [self performSelector:@selector(finishReloadData) withObject:nil afterDelay:2];
}

- (void)startToLoadMoreData
{
    [super startToLoadMoreData];
    [self performSelector:@selector(finishLoadMoreData) withObject:nil afterDelay:2];
}

@end

//
//  TimelineController.m
//  Piner
//
//  Created by Gamy on 13-12-19.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "TimelineController.h"
#import "ModelManager.h"
#import "ActivityCell.h"

@interface TimelineController ()
{
    
}
@end

@implementation TimelineController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self startRefreshing];
    [SignController presentFromController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Class)tableViewCellClassAtIndexPath:(NSIndexPath *)indexPath
{
    Activity *activity = [self itemAtIndexPath:indexPath];
    if ([activity.image length] > 0) {
        return [ActivityWithImageCell class];
    }
    return [ActivityCell class];
}

- (void)startToReloadData
{
    [super startToReloadData];
    NSArray *list = [ModelManager genActivityList:10];
    [self performSelector:@selector(finishReloadData:) withObject:list afterDelay:1];
}

- (void)startToLoadMoreData
{
    [super startToLoadMoreData];
    NSArray *list = [ModelManager genActivityList:10];
    [self performSelector:@selector(finishLoadMoreData:) withObject:list afterDelay:1];
}

@end

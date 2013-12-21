//
//  MMTableViewController.m
//  Piner
//
//  Created by Gamy on 13-12-19.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "MMTableViewController.h"

@interface MMTableViewController ()

@property(nonatomic, weak)MJRefreshFooterView *refreshFooter;

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
    [self.refreshControl addTarget:self action:@selector(startToReloadData) forControlEvents:UIControlEventValueChanged];
    self.refreshControl.attributedTitle = nil;
    
    self.refreshFooter = [MJRefreshFooterView footer];
    [self.refreshFooter setScrollView:self.tableView];
    self.refreshFooter.delegate = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupRefreshViews];
//    [self beginRefreshing];
//    [self performSelector:@selector(beginRefreshing) withObject:nil afterDelay:2];
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark 代理方法-进入刷新状态就会调用
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"加载数据中..."];
    [self startToLoadMoreData];
}

- (void)beginRefreshing
{
//    [self.refreshControl beginRefreshing];
//    [self startToReloadData];
//    [self.refreshControl sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)startToReloadData:(id)refreshControl
{
    [self startToReloadData];
}

- (void)startToReloadData
{
    NSLog(@"startToReloadData");
    [self performSelector:@selector(finishReloadData) withObject:nil afterDelay:2];
}
- (void)finishReloadData
{
    [self.refreshControl endRefreshing];
    self.refreshControl.attributedTitle = nil;
}

- (void)startToLoadMoreData
{
    [self performSelector:@selector(finishLoadMoreData) withObject:nil afterDelay:2];
}
- (void)finishLoadMoreData
{
    [self.refreshFooter endRefreshing];
}

@end

//
//  BusinessController.m
//  Piner
//
//  Created by Gamy on 14-1-12.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "BusinessController.h"
#import "BusinessCell.h"
#import "DPService.h"
#import "MMPickingCityController.h"
#import "UIViewController+Search.h"

@interface BusinessController ()

@property(copy, nonatomic)NSString *keyword;

@end

@implementation BusinessController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self enableSearch];
    [self setPlaceholder:@"请输入商户名/地址/标签"];
    [[self searchBar] becomeFirstResponder];
    
    MMPickingCityController *cityPicker = [[MMPickingCityController alloc] init];
    [self presentViewController:cityPicker animated:YES completion:NULL];
//    [self.navigationController pushViewController:cityPicker animated:YES];
//    [self startRefreshing];
//    UISearchBar *searchBar = [[UISearchBar alloc] init];
//    [searchBar setPrompt:@"prompt"];
//    [searchBar setPlaceholder:@"holder"];
//    self.navigationItem.titleView = searchBar;

//    [self.navigationController.navigationBar setTintColor:[UIColor greenColor]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Class)tableViewCellClassAtIndexPath:(NSIndexPath *)indexPath
{
    return [BusinessCell class];
}

- (void)serviceLoadDataWithCompletion:(void (^)(NSArray *businesses))completion
{
    [DPService findNearbyBusinessesByKeyword:[self keyword] category:@"美食" page:[self nextPage] callback:^(NSError *error, NSArray *businesses) {
        if (error) {
            [self failToLoadData:error];
        }else{
            if (completion != NULL) {
                completion(businesses);
            }
        }
    }];
}


- (void)startToReloadData
{
    [super startToReloadData];
    [DPService clearBusinessCacheData];
 
    [self serviceLoadDataWithCompletion:^(NSArray *businesses) {
        [self finishReloadData:businesses];
//        [[self searchBar] resignFirstResponder];
        [[self searchBar] setText:nil];
    }];
}

- (void)startToLoadMoreData
{
    [super startToLoadMoreData];
    [self serviceLoadDataWithCompletion:^(NSArray *businesses) {
        [self finishLoadMoreData:businesses];
        self.hasMoreData = ([businesses count] > 0);
    }];

}

- (void)didClickedSearchWithText:(NSString *)text
{
    self.keyword = text;
    [self startRefreshing];
}


@end

//
//  MMPickingCityController.m
//  Piner
//
//  Created by Gamy on 14-1-12.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "MMPickingCityController.h"
#import "MMLocationManager.h"
#import "UIViewController+Search.h"
#import "NSArray+Ext.h"

@interface MMPickingCityController ()
{
    NSArray *_cities;
    NSArray *_titles;
    BOOL _isInputing;
    NSString *_searchText;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *gpsCityLabel;
@property (weak, nonatomic) IBOutlet UITableView *cityTableView;



@end

@implementation MMPickingCityController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSString *cityFile = [[NSBundle mainBundle] pathForResource:@"cities" ofType:@"plist"];
        _cities = [NSArray arrayWithContentsOfFile:cityFile];
    }
    return self;
}

- (void)updateCityLabel:(UILabel *)label
{
    [label setFont:[UIFont systemFontOfSize:14]];
    [label setTextColor:[UIColor grayColor]];

}

- (void)handleNewLocation:(NSNotification *)note
{
    if ([note.name isEqualToString:UPDATE_LOCATION_NOTIFICATION]) {
        NSLog(@"position done.");
        NSString *city = [[MMLocationManager defaultManager] city];
        if ([city length] != 0) {
            [self.gpsCityLabel setText:[NSString stringWithFormat:@"定位城市: %@", city]];            
        }
    }else if([note.name isEqualToString:UPDATE_LOCATION_NOTIFICATION_FAILED]){
        NSLog(@"position failed.");
        NSString *message = note.userInfo[@"message"];
        [self.gpsCityLabel setText:message];
    }
}


- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    [[MMLocationManager defaultManager] unregisterObserver:self];
    [super dismissViewControllerAnimated:flag completion:completion];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.gpsCityLabel setText:@"定位中..."];
    [self setTitle:@"选择城市"];
    [self updateCityLabel:self.gpsCityLabel];
    [[MMLocationManager defaultManager] syncLoaction];
 
    [[MMLocationManager defaultManager] registerObserver:self handler:@selector(handleNewLocation:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (NSArray *)citiesWithPrefix:(NSString *)prefix
{
    NSMutableArray *allCities = [NSMutableArray array];
    for (NSDictionary *info in _cities) {
        NSArray *subCities = [info allValues][0];
        [allCities addObjectsFromArray:subCities];
    }
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", prefix];
    return [[allCities filteredArrayUsingPredicate:pred] unique];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *city = nil;
    if (_isInputing) {
        city =[self citiesWithPrefix:_searchText][indexPath.row];
    }else{
        NSDictionary *info = _cities[indexPath.section];
        NSArray *cities = [info allValues][0];
        city = cities[indexPath.row];
    }
    static NSString *CityCellIdentifier = @"CityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CityCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CityCellIdentifier];
        [self updateCityLabel:cell.textLabel];
    }
    [cell.textLabel setText:city];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _isInputing ? 1 : [_cities count];
}

- (NSString *)keyInSection:(NSInteger)section
{
    NSDictionary *dict = _cities[section];
    NSArray *keys = [dict allKeys] ;
    if ([keys count] > 0) {
        return keys[0];
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self keyInSection:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_isInputing) {
        return [[self citiesWithPrefix:_searchText] count];
    }
    NSString *key = [self keyInSection:section];
    return [_cities[section][key] count];
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (_isInputing) {
        return nil;
    }
    if (_titles) {
        return _titles;
    }
    NSMutableArray *titles = [NSMutableArray array];
    NSInteger index = 0;
    for (NSDictionary *info in _cities) {
        NSString *title = [self keyInSection:index];
        [titles addObject:title];
        index ++;
    }
    _titles = titles;
    return titles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
   return [[self sectionIndexTitlesForTableView:self.cityTableView] indexOfObject:title];
}

- (void)didSearchTextChanged:(NSString *)text
{
    _searchText = text;
    _isInputing = !([text length] == 0);
    [[self cityTableView] reloadData];
}

@end

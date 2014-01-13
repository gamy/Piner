//
//  MMController+Search.h
//  Piner
//
//  Created by Gamy on 14-1-12.
//  Copyright (c) 2014年 Piner. All rights reserved.
//


@interface UIViewController(Search)<UISearchBarDelegate>

- (void)enableSearch;
- (void)setPlaceholder:(NSString *)text;
- (void)setSearchText:(NSString *)text;
- (UISearchBar *)searchBar;

//callback should be override by subclasses
- (void)didCanceled;
- (void)didClickedSearchWithText:(NSString *)text;
- (void)didSearchTextChanged:(NSString *)text;
@end

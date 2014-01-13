//
//  MMController+Search.m
//  Piner
//
//  Created by Gamy on 14-1-12.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "UIViewController+Search.h"

@implementation UIViewController(Search)

- (void)enableSearch
{
    if (![self searchBar]) {
        UISearchBar *bar = [[UISearchBar alloc] init];
        self.navigationItem.titleView = bar;
        [bar setShowsCancelButton:YES];
        [bar setDelegate:self]; 
    }
}
- (void)setPlaceholder:(NSString *)text
{
    [[self searchBar] setPlaceholder:text];
}
- (void)setSearchText:(NSString *)text
{
    [[self searchBar] setText:text];
}
- (UISearchBar *)searchBar
{
    if ([self.navigationItem.titleView isKindOfClass:[UISearchBar class]]){
        return (id)self.navigationItem.titleView;
    }
    return nil;
}


#define MASKVIEW_TAG 20141111
#define MASK_COLOR [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]

- (void)addMaskView
{
    if (![self maskView]) {
        UIControl *mask = [[UIControl alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:mask];
//        [mask setBackgroundColor:MASK_COLOR];
        mask.tag = MASKVIEW_TAG;
        [mask addTarget:self action:@selector(hideSearchViews) forControlEvents:UIControlEventTouchUpInside];
        
        if ([self.view isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self.view setScrollEnabled:NO];
        }
    }
}


- (UIView *)maskView
{
    return [self.view viewWithTag:MASKVIEW_TAG];
}

- (void)removeMaskView
{
    [[self maskView] removeFromSuperview];
}

- (void)hideSearchViews
{
    [self removeMaskView];
    [[self searchBar] setShowsCancelButton:NO animated:YES];
    [[self searchBar] resignFirstResponder];
    if ([self.view isKindOfClass:[UIScrollView class]]) {
        [(UIScrollView *)self.view setScrollEnabled:NO];
    }
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self addMaskView];
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self hideSearchViews];
    [self didClickedSearchWithText:searchBar.text];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [self hideSearchViews];
    [self didCanceled];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self didSearchTextChanged:searchText];
}

- (void)didSearchTextChanged:(NSString *)text
{
    
}

//callback should be override by subclasses
- (void)didCanceled
{
    
}
- (void)didClickedSearchWithText:(NSString *)text
{
    
}

@end

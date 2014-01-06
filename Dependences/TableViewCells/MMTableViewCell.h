//
//  MMTableViewCell.h
//  Piner
//
//  Created by Gamy on 13-12-19.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMTableViewCell : UITableViewCell
{
    @protected
        id _item;
}
@property(nonatomic, weak)id delegate;
@property(nonatomic, strong)NSIndexPath *indexPath;

- (id)item;
- (void)setItem:(id)item;


+ (instancetype)cell;
+ (NSString *)identifier;


//To be override.
- (void)setup;
+ (CGFloat)heightForItem:(id)item;
- (void)layoutSubviews;

@end

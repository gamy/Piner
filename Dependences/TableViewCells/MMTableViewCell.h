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
- (void)updateWithItem:(id)item;


//To be override.
+ (instancetype)cell;
+ (CGFloat)heightForItem:(id)item;
+ (NSString *)identifier;
- (void)layoutSubviews;

@end

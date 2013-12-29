//
//  MMTableViewCell.m
//  Piner
//
//  Created by Gamy on 13-12-19.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "MMTableViewCell.h"
#import "UIView+Ext.h"

@implementation MMTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)item
{
    return _item;
}


+ (instancetype)cell
{
   return [self viewFromXib:[self identifier] index:0];
}
+ (CGFloat)heightForItem:(id)item
{
    return 44;
}
+ (NSString *)identifier
{
    return @"cell";
}
- (void)updateWithItem:(id)item
{
    _item = item;
    [self setNeedsLayout];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
}


@end

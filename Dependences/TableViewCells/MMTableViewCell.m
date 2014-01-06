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

- (void)setup
{
    
}

+ (instancetype)cell
{
    MMTableViewCell *cell = [self viewFromXib:[self identifier] index:0];
    [cell setup];
    return cell;
}
+ (CGFloat)heightForItem:(id)item
{
    return 44;
}
+ (NSString *)identifier
{
    return NSStringFromClass([self class]);
}

- (void)setItem:(id)item
{
    _item = item;
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}


@end

//
//  ActivityCell.m
//  Piner
//
//  Created by Gamy on 14-1-6.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "ActivityCell.h"
#import "UIImageView+Ext.h"
#import "NSString+Ext.h"
#import "CGUtil.h"
#import "NSDate+Ext.h"

@interface ActivityCell()
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *nick;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *timestamp;

+ (CGFloat)minHeight;

@end


#define MIN_HEIGHT ([self minHeight])
#define CONTENT_WIDTH 250

@implementation ActivityCell

+ (CGFloat)minHeight
{
    return 58.0f;
}

- (Activity *)activity
{
    return _item;
}

+ (CGFloat)heightForItem:(id)item
{
    Activity *activity = item;
    NSDictionary *dict = @{NSFontAttributeName: [UIUtil contentFont]};
    CGRect rect = [activity.desc boundingRectWithSize:CGSizeMake(CONTENT_WIDTH, MAXFLOAT)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:dict
                                              context:nil];
    return CGRectGetHeight(rect) + MIN_HEIGHT;
}

- (void)setup
{
    [self.content setNumberOfLines:0];
    self.content.backgroundColor = [UIColor clearColor];
    self.nick.backgroundColor = [UIColor clearColor];
    self.timestamp.backgroundColor = [UIColor clearColor];
    
    [self.content setLineBreakMode:NSLineBreakByCharWrapping];
    [self.content setTextColor:[UIUtil contentColor]];
    [self.timestamp setTextColor:[UIUtil timeColor]];
    [self.nick setTextColor:[UIUtil nickColor]];
    
    [self.content setFont:[UIUtil contentFont]];
    [self.timestamp setFont:[UIUtil timeFont]];
    [self.nick setFont:[UIUtil nickFont]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    Activity *activity = [self activity];
    NSURL *url = [[[activity host] avatar] URL];
    [self.avatar setImageWithURL:url placeholderImage:nil animated:YES];
    [self.nick setText:[[activity host] nick]];
    [self.content setText:[activity desc]];
    [self.timestamp setText:[activity.createDate timelineStamp]];
}

@end

@interface ActivityWithImageCell()

@property (weak, nonatomic) IBOutlet UIImageView *contentImage;

@end

@implementation ActivityWithImageCell

+ (instancetype)cell
{
    ActivityWithImageCell *cell = [ActivityWithImageCell viewFromXib:@"ActivityCell" index:1];
    [cell setup];
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.indexPath.row == 9) {
        NSLog(@"stop");
    }
    [self.contentImage setImageWithURL:[[[self activity] image] URL]];
    if (self.contentImage.image) {
        CGSize size = self.contentImage.image.size;
        CGFloat height = CGRectGetHeight(self.contentImage.bounds);
        CGSize adjustSize = [CGUtil adjustSize:size withConstHeight:height];
        [self.contentImage updateSizeWidth:adjustSize.width];
    }
}

+ (CGFloat)minHeight
{
    return 181.0f;
}

@end

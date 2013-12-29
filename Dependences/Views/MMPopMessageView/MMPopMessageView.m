//
//  MMPopMessageView.m
//  Piner
//
//  Created by Gamy on 13-12-29.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "MMPopMessageView.h"

@interface MMPopMessageView()

@property(nonatomic, weak) UILabel *label;

@end

@implementation MMPopMessageView

- (void)updateLabel
{
    if (self.label == nil) {
        CGRect frame = CGRectInset(self.bounds, 10, 10);
        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        label.autoresizingMask = (0x1 << 6) -1;
        [label setBackgroundColor:[UIColor clearColor]];
        label.numberOfLines = 0;
        [label setTextColor:[UIColor blackColor]];
        [label setFont:[UIFont systemFontOfSize:18]];
        [self addSubview:label];
        self.label = label;
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self updateLabel];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setRoundCorner:2 border:0.5 borderColor:[UIColor lightGrayColor]];
    }
    return self;
}


#define VIEW_WIDTH 220
#define LABEL_WIDTH 200
#define MIN_HEIGHT 80

+ (instancetype)view
{
    MMPopMessageView *view = [[MMPopMessageView alloc] initWithFrame:CGRectMake(0, 0, 220, 100)];
    return view;
}

- (void)dismiss
{
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

+ (MMPopMessageView *)popupMessage:(NSString *)message inView:(UIView *)view
{
    MMPopMessageView *pview = [self view];
    [pview setText:message];
    pview.center = CGPointMake(CGRectGetMidX(view.bounds), CGRectGetMidY(view.bounds));
    [view addSubview:pview];
    [pview performSelector:@selector(dismiss) withObject:nil afterDelay:1];
    return pview;
}
+ (MMPopMessageView *)popupMessage:(NSString *)message
{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    MMPopMessageView *view = [self popupMessage:message inView:keyWindow];
    [view updateCenterY:CGRectGetMidY(keyWindow.bounds)-40];
    return view;
}


- (void)setText:(NSString *)text
{
    [self.label setText:text];
    [text sizeWithAttributes:nil];
    NSDictionary *dict = @{NSFontAttributeName: self.label.font};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(LABEL_WIDTH, MAXFLOAT)
                       options:NSStringDrawingUsesLineFragmentOrigin
                    attributes:dict
                       context:nil];
    rect.size.width += 20;
    rect.size.height += 20;
    [self setFrame:rect];
    rect = CGRectInset(rect, 10, 10);
    [self.label setFrame:rect];
}


@end

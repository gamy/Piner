//
//  MMActivityView.m
//  Piner
//
//  Created by Gamy on 13-12-28.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "MMActivityView.h"
#import "UIView+Ext.h"

@interface MMActivityView()

@property(nonatomic, strong)UIActivityIndicatorView *ai;
@property(nonatomic, strong)UILabel *textLabel;
@property(nonatomic, strong)UIView *maskView;
@end

@implementation MMActivityView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self addSubview:self.ai];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
    }
    return self;
}


+ (instancetype)activityView
{
    MMActivityView *view = [[MMActivityView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    return view;
}

#define TEXT_FONT [UIFont boldSystemFontOfSize:20]
#define EDGE_SPACE 15
#define CONTENT_SPACE 10

- (void)updateView
{
    if ([self.text length] == 0) {
        CGRect rect = CGRectInset(_ai.bounds, -EDGE_SPACE, -EDGE_SPACE);
        self.frame = rect;
        self.ai.center = self.center;
    }else{
        if (self.textLabel == nil) {
            self.textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            [self.textLabel setTextColor:[UIColor lightGrayColor]];
            [self addSubview:self.textLabel];
        }
//        if ([self.textLabel.text isEqualToString:_text]) {
//            return;
//        }
        [self.textLabel setText:self.text];
        [self.textLabel sizeToFit];
        
        CGFloat width = CGRectGetWidth(_textLabel.frame);
        width = MAX(CGRectGetWidth(_ai.frame), width) + EDGE_SPACE * 2;
        
        CGFloat height = CGRectGetHeight(_ai.frame)+CGRectGetHeight(_textLabel.frame);
        height += EDGE_SPACE * 2 + CONTENT_SPACE;
        
        self.frame = CGRectMake(0, 0, width, height);
        [_ai updateCenterX:self.center.x];
        [_ai updateOriginY:EDGE_SPACE];
        [_textLabel updateCenterX:self.center.x];
        [_textLabel updateOriginY:CGRectGetMaxY(_ai.frame)+CONTENT_SPACE];

    }
    [self.ai startAnimating];
}

- (void)setupMaskView:(CGRect)frame
{
    self.maskView = [[UIView alloc] initWithFrame:frame];
    self.maskView.userInteractionEnabled = YES;
}

- (void)showInView:(UIView *)view
{
    [view addSubview:self];
    [self updateView];
    self.center = view.center;
    if (_hasMask) {
        if (self.maskView == nil) {
            [self setupMaskView:view.bounds];
        }
        self.maskView.frame = view.bounds;
        [view addSubview:self.maskView];
    }
}

- (void)dismiss
{
    [self removeFromSuperview];
    [self.maskView removeFromSuperview];
}

@end

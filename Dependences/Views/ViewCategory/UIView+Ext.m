//
//  UIView+Ext.m
//  Piner
//
//  Created by Gamy on 13-12-28.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "UIView+Ext.h"

@implementation UIView(Ext)

- (CGRect)updateOriginX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
    return self.frame;
}

- (CGRect)updateOriginY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
    return self.frame;
}

- (CGRect)updateSizeWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
    return self.frame;
}

- (CGRect)updateSizeHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
    return self.frame;
}

- (CGRect)updateCenterX:(CGFloat)x
{
    self.center = CGPointMake(x, self.center.y);
    return self.frame;
}

- (CGRect)updateCenterY:(CGFloat)y
{
    self.center = CGPointMake(self.center.x, y);
    return self.frame;    
}

- (void)setRoundCorner:(CGFloat)radius border:(CGFloat)border borderColor:(UIColor *)color
{
    [self.layer setCornerRadius:radius];
    [self.layer setBorderWidth:border];
    [self.layer setBorderColor:color.CGColor];
    [self.layer setMasksToBounds:YES];
}

- (void)setRoundCorner:(CGFloat)radius
{
    [self.layer setCornerRadius:radius];
    [self.layer setMasksToBounds:YES];
}


+ (instancetype)viewFromXib:(NSString *)xibName index:(NSInteger)index
{
    NSArray *list = [[NSBundle mainBundle] loadNibNamed:xibName owner:self options:nil];
    if ([list count] > index && index >= 0) {
        return list[index];
    }
    NSLog(@"list count = %d, index = %d",[list count], index);
    return nil;
}
+ (instancetype)viewFromXib:(NSString *)xibName
{
    return [self viewFromXib:xibName index:0];
}

@end


@implementation UIView(Touchable)


- (void)enableTapWithTarget:(id)target
       handleGuestureSelector:(SEL)selector
{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
}

- (void)disableTouch
{
    self.userInteractionEnabled = NO;
    [self.gestureRecognizers enumerate:^(id value){
        [self removeGestureRecognizer:value];
    }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return YES;
}

@end

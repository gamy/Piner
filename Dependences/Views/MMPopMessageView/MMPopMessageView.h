//
//  MMPopMessageView.h
//  Piner
//
//  Created by Gamy on 13-12-29.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMPopMessageView : UIView

+ (MMPopMessageView *)popupMessage:(NSString *)message inView:(UIView *)view;
+ (MMPopMessageView *)popupMessage:(NSString *)message;

@end

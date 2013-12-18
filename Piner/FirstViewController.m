//
//  FirstViewController.m
//  Piner
//
//  Created by Gamy on 13-12-18.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "FirstViewController.h"
#import "AFNetworking.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog([[AFHTTPSessionManager manager] baseURL]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

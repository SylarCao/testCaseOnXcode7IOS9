//
//  TimerVCTL.m
//  testCase
//
//  Created by sylar on 15/9/22.
//  Copyright (c) 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TimerVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TimerVCTL ()

@property (nonatomic, strong) NSTimer *timer;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TimerVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(showLog) userInfo:nil repeats:YES];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showLog) userInfo:nil repeats:YES];
    
//    [_timer fire];
}

- (void) showLog
{
    NSLog(@"time ======== ");
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [_timer invalidate];
    _timer = nil;
}

- (IBAction)btn1:(id)sender
{
    [_timer invalidate];
}

- (IBAction)btn2:(id)sender
{
    
}



@end

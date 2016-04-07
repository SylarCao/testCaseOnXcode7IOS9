//
//  TimerVCTL.m
//  testCase
//
//  Created by sylar on 15/9/22.
//  Copyright (c) 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TimerVCTL.h"
#import "TimerInstance.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TimerVCTL ()

@property (nonatomic, strong) NSTimer *timer;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TimerVCTL

- (void)dealloc
{
    // will not dealloc if (_timer != nil)
    NSLog(@"dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self fun2];
}

- (void)fun2
{
    static int i = 0;
    i++;
//    [[TimerInstance share] startTimer:self selector:@selector(showLogWithContent:) content:[NSString stringWithFormat:@"abc%ld", i]];
    
//    [[TimerInstance share] reStartTimer:self selector:@selector(showLogWithContent:) content:[NSString stringWithFormat:@"abc%d", i]];
}

- (void)fun1
{
    
//    _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(showLog) userInfo:nil repeats:YES];  // 没什么用
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:7 target:self selector:@selector(showLog) userInfo:nil repeats:YES];
    
//        [_timer fire];
}

- (void) showLog
{
    NSLog(@"time ======== ");
}

- (void)showLogWithContent:(NSString *)content
{
    NSLog(@"content ========= %@", content);
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [_timer invalidate];
    _timer = nil;
}

- (IBAction)btn1:(id)sender
{
//    [_timer invalidate];
//    [self fun2];
    [self fun1];
}

- (IBAction)btn2:(id)sender
{
//    [_timer fire];
    
//    [[TimerInstance share] fun1];
    [_timer fire];
    NSLog(@"fire");
}



@end

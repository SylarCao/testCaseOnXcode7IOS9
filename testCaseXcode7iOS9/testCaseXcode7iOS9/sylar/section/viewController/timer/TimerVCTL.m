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

@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, copy) NSString *s1;

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
    
//    [self fun1];
    
//    [self fun2];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
//    [_timer invalidate];
//    _timer = nil;
}

- (IBAction)btn1:(id)sender
{
//    [_timer invalidate];
//    [self fun2];
    [self fun1];
    
//    [self fun3];
}

- (IBAction)btn2:(id)sender
{
//    [_timer fire];
    
//    [[TimerInstance share] fun1];
    [_timer fire];
    NSLog(@"fire");
}

- (void)fun3 {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        self.s1 = @"123";
        NSLog(@"sylar :  5555 = %@", self.s1);
    });
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
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(showLog) userInfo:nil repeats:YES];
    
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


@end

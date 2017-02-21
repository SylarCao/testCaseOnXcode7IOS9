//
//  EnterBkgdVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/2/21.
//  Copyright © 2017年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "EnterBkgdVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface EnterBkgdVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation EnterBkgdVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fun1];
    
    [self fun2];
}

- (void)fun1 {
    // nstimer
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerFun1) userInfo:nil repeats:YES];
}

- (void)timerFun1 {
    // 模拟器会log 真机不会log
    NSLog(@"sylar :  EnterBkgdVCTL.timerFun1  #####");
}

- (void)fun2 {
    NSThread *tt = [[NSThread alloc] initWithTarget:self selector:@selector(fun2Thread) object:nil];
    tt.qualityOfService = NSQualityOfServiceUserInitiated;
    [tt start];
}

- (void)fun2Thread {
    while (1) {
        // 模拟器会log 真机不会log
        NSLog(@"sylar :  EnterBkgdVCTL.thread ******");
        [NSThread sleepForTimeInterval:4];
    }
}


@end

//
//  ThreadVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/1/6.
//  Copyright © 2017年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ThreadVCTL.h"
#import "ThreadMethod1.h"
#import "ThreadMain1.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ThreadVCTL ()

@property (nonatomic, strong) ThreadMethod1 *m1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ThreadVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender {
    
//    [self fun1];
    
    [self fun2];
    
}

- (void)fun1 {
    ThreadMethod1 *m1 = [[ThreadMethod1 alloc] init];
    _m1 = m1;
    [m1 method1];
    
}

- (void)fun2 {
    [[ThreadMain1 share] fun1];
}



@end

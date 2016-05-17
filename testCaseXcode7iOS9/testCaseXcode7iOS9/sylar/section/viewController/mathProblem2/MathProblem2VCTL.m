//
//  MathProblem2VCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/14.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "MathProblem2VCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface MathProblem2VCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation MathProblem2VCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self roundFunction1];
    
    [self fun2];
}

- (void)roundFunction1
{
    NSInteger a1 = round(3.3);  // 3
    NSInteger a2 = round(3.5);  // 4
    NSInteger a3 = round(3.0);  // 3
    NSInteger a4 = round(2.9);  // 3
    
    NSLog(@"a123 = %ld, %ld, %ld %ld", a1, a2, a3, a4);
}

- (void)fun2
{
    CGFloat f1 = 3.4;
    CGFloat f2 = 3;
    CGFloat f3 = 3.0;
    
    NSInteger a1 = ceilf(f1);
    NSInteger a2 = ceilf(f2);
    NSInteger a3 = ceilf(f3);
    
    CGFloat d1 = ceilf(f1);
    CGFloat d2 = ceilf(f2);
    CGFloat d3 = ceilf(f3);
    
    NSLog(@"a123 = %d, %d, %d", a1, a2, a3);
    NSLog(@"d123 = %f, %f, %f", d1, d2, d3);
    
}

@end

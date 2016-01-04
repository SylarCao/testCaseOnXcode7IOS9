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
    
    [self roundFunction1];
}

- (void)roundFunction1
{
    NSInteger a1 = round(3.3);
    NSInteger a2 = round(3.5);
    NSInteger a3 = round(3.0);
    
    NSLog(@"a123 = %ld, %ld, %ld", a1, a2, a3);
}

@end

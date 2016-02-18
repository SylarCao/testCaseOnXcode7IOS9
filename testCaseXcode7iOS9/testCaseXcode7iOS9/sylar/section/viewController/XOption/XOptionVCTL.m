//
//  XOptionVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/2/18.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "XOptionVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface XOptionVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation XOptionVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fun1];
}

- (void)fun1
{
    NSInteger op = op_test0;
    
    if (op & op_test2)
    {
        NSLog(@"op_test2");
    }
    
    if (op & op_test3)
    {
        NSLog(@"op_test3");
    }
    
    if (op & op_test4)
    {
        NSLog(@"op_test4");
    }
    
    if (op & op_test5)
    {
        NSLog(@"op_test5");
    }
}




@end

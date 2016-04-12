//
//  CPlusVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/12.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "CPlusVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface CPlusVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation CPlusVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self fun1];
}

- (void)fun1
{
//    printf("1 "    "2 " "3 " "4 ");
//    printf("\n------\n");
//    printf("1 2 3 4");
    
    // 1
    printf("1234");
    
    printf("\n------\n");
    
    // 2
    printf("%d%d%d%d", 1,2,3,4);
    
    printf("\n------\n");
    
    //3
    printf("1");
    printf("2");
    printf("3");
    printf("4");
}

@end

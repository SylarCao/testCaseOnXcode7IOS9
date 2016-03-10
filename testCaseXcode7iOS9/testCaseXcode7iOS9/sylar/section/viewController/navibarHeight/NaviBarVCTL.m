//
//  NaviBarVCTL.m
//  testCase
//
//  Created by sylar on 15/9/21.
//  Copyright (c) 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "NaviBarVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface NaviBarVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NaviBarVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNaviBarHeight];
    
    [self setWindowFrame];
}


- (void) setNaviBarHeight
{
    // for iphone 5
    CGFloat f1 = self.navigationController.navigationBar.frame.size.height;
    CGFloat f2 = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    
    NSLog(@"iphone 5 (44, 20) -- %f --- %f", f1, f2);
    NSLog(@"iphone 6 plus (44, 20) -- %f --- %f", f1, f2);
    
}

- (void) setWindowFrame
{
    CGSize ss = self.view.frame.size;
    
    NSLog(@"frame = %f, %f", ss.width, ss.height);
}

@end

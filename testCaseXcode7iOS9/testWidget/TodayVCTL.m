//
//  TodayVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/1/3.
//  Copyright © 2017年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TodayVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TodayVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TodayVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 300);
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 每次移动到widget都会调用这个方法
    NSLog(@"sylar :  view will appear");
}


@end

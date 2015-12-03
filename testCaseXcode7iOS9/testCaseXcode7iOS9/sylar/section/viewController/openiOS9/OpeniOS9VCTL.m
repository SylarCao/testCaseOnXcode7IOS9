//
//  OpeniOS9VCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/3.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "OpeniOS9VCTL.h"

// 见 appDelegate里的 [ 打开app ]
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface OpeniOS9VCTL ()

@property (nonatomic, weak) IBOutlet UILabel *lb1;
@property (nonatomic, weak) IBOutlet UILabel *lb2;
@property (nonatomic, weak) IBOutlet UILabel *lb3;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation OpeniOS9VCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)fun1
{
    _lb1.text = @"fun11111";
}


@end

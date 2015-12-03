//
//  Life1VCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/3.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "Life1VCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface Life1VCTL ()


@property (nonatomic, weak) IBOutlet UILabel *lb1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation Life1VCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)fun1
{
    if (_lb1)
    {
        _lb1.text = @"label1 fun1111";
    }
    else
    {
        NSLog(@"not label 1");
    }
    
}



@end

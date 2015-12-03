//
//  Life2VCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/3.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "Life2VCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface Life2VCTL ()

@property (nonatomic, strong) UILabel *lb1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation Life2VCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _lb1 = [[UILabel alloc] init];
    _lb1.frame = CGRectMake(100, 100, 100, 100);
    _lb1.backgroundColor = [UIColor redColor];
    _lb1.textColor = [UIColor blackColor];
    _lb1.text = @"label1 init";
    [self.view addSubview:_lb1];
}

- (void)fun2
{
    if (_lb1)
    {
        _lb1.text = @"fun2  label2222";
    }
    else
    {
        NSLog(@"not label1");
    }
}






@end

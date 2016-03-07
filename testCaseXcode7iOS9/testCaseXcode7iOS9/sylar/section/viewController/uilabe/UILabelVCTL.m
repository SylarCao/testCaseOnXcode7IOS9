//
//  UILabelVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/3.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "UILabelVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface UILabelVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UILabelVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setWithLabel1];
}

- (void)setWithLabel1
{
    UILabel *lb1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 50, 300)];
    lb1.layer.borderColor = [UIColor redColor].CGColor;
    lb1.layer.borderWidth = 1;
    lb1.text = @"竖\n着\n排\n列\n的\n文\n字";
    lb1.numberOfLines = 0;
    [self.view addSubview:lb1];
}

@end

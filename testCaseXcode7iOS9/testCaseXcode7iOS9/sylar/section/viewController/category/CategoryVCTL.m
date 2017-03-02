//
//  CategoryVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/22.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "CategoryVCTL.h"
#import "ViewCategory1.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface CategoryVCTL ()

@property (nonatomic, weak) IBOutlet UIView *v1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation CategoryVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender
{
    [_v1 showRedView];
}

- (IBAction)btn2:(id)sender
{
//    [_v1 hideRedView];
    _v1.v1.hidden = YES;
    
//    _v1.s1 = @"222";
}

@end

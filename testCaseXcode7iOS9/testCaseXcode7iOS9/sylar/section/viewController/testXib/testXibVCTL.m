//
//  testXibVCTL.m
//  testCase
//
//  Created by sylar on 15/9/21.
//  Copyright (c) 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "testXibVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface testXibVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation testXibVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addXibView];
}

- (void) addXibView
{
    UINib *nib = [UINib nibWithNibName:@"X1" bundle:nil];
    UIView *v1 = [[nib instantiateWithOwner:self options:nil] objectAtIndex:0];
    
    v1.frame = CGRectMake(0, 0, 70, 70);
    v1.backgroundColor = [UIColor greenColor];
    
    
//    [self.view addSubview:v1];
    
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(20, 120, 70, 70)];
    v2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:v2];
    [v2 addSubview:v1];
}




@end

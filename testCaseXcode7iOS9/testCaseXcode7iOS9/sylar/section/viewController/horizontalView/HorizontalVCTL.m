//
//  HorizontalVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/28.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "HorizontalVCTL.h"
#import "HorizontalView.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface HorizontalVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation HorizontalVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addView1];
}

- (void)addView1
{
    CGRect frame = self.view.bounds;
    HorizontalView *v1 = [[HorizontalView alloc] initWithFrame:CGRectMake(0, 0, frame.size.height, frame.size.width)];
    v1.center = CGPointMake(frame.size.width/2, frame.size.height/2);
    [self.view addSubview:v1];
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation(90 / 180.0 * M_PI );
    [v1 setTransform:rotate];
}



@end

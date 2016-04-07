//
//  AnimationVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/7.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "AnimationVCTL.h"
#import "AnimationRotateVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
// reference: https://github.com/lizelu/CATransitionDemo/tree/master/CATransition

////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface AnimationVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AnimationVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender
{
    [self fun1];
}

- (void)fun1
{
    AnimationRotateVCTL *aa = [[AnimationRotateVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController: aa animated:YES];
}


@end

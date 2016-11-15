//
//  SubViewIndexVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/11/15.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "SubViewIndexVCTL.h"
#import "NormalTableViewVCTL.h"
#import "PullingTableViewVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface SubViewIndexVCTL ()



@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation SubViewIndexVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)btnNormal:(id)sender
{
    [self toNormal];
}

- (IBAction)btnPulling:(id)sender
{
    [self toRefresh];
}

- (void)toNormal
{
    NormalTableViewVCTL *nn = [[NormalTableViewVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:nn animated:YES];
}

- (void)toRefresh
{
    PullingTableViewVCTL *pp = [[PullingTableViewVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:pp animated:YES];
}


@end

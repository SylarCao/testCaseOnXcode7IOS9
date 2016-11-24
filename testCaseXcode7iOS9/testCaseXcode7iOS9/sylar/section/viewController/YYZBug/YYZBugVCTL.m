//
//  YYZBugVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/11/11.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "YYZBugVCTL.h"
#import "SubViewIndexVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface YYZBugVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation YYZBugVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self fun2];
}

- (IBAction)btn1:(id)sender
{
    [self fun1];
    
}

- (void)fun2
{
    NSUInteger a1 = 0;
    a1 = a1-150;
    NSLog(@"sylar :  a1 = %lu", (unsigned long)a1);
}

- (void)fun1
{
    SubViewIndexVCTL *ss = [[SubViewIndexVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:ss animated:YES];
}





@end

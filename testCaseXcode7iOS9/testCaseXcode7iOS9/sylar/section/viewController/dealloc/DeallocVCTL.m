//
//  DeallocVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/8.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "DeallocVCTL.h"
#import "Dealloc2VCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DeallocVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DeallocVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender
{
    Dealloc2VCTL *v2 = [[Dealloc2VCTL alloc] init];
    [self.navigationController pushViewController:v2 animated:YES];
    
}



@end

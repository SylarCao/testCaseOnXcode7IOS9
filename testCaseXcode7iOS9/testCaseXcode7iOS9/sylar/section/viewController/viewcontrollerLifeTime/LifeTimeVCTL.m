//
//  LifeTimeVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/3.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "LifeTimeVCTL.h"
#import "Life1VCTL.h"
#import "Life2VCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface LifeTimeVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation LifeTimeVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)btn1:(id)sender
{
    Life1VCTL *l1 = [[Life1VCTL alloc] initWithNibName:nil bundle:nil];
//    [l1 fun1];
//    [self.navigationController pushViewController:l1 animated:YES];
//    [l1 fun1];
    
    [self presentViewController:l1 animated:YES completion:^{
        [l1 fun1];
    }];
}

- (IBAction)btn2:(id)sender
{
    Life2VCTL *l2 = [[Life2VCTL alloc] initWithNibName:nil bundle:nil];
    [l2 fun2];
    [self.navigationController pushViewController:l2 animated:YES];
}



@end

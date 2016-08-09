//
//  StructVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/8/9.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "StructVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface StructVCTL ()
{
    int m1;
}

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation StructVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self->m1 = 1;
    
}

- (IBAction)btn1:(id)sender
{
    [self fun1];
}

- (void)fun1
{
    DZH_DATAHEAD h1;
    h1.tag = 1;
    h1.type = 12;
    h1.attrs = 14;
    h1.length = 76;
    
    DZH_DATAHEAD *p1 = &h1;
    NSLog(@"p1 = %d", p1->type);
    
    int a1 = p1->type;
    NSLog(@"a1 = %ld", a1);
    
    self->m1 = p1->type;
    
    NSLog(@"m1 = %d", self->m1);
    
}





@end

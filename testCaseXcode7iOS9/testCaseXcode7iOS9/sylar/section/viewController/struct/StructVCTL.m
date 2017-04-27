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
//    [self fun1];
    
    [self fun2];
    
//    [self fun3];
    
//    [self fun4];
}

- (void)fun4
{
    NSInteger a1 = sizeof(SX);
    NSInteger a2 = sizeof(SY);
    NSInteger a3 = sizeof(SZ);
    NSInteger a4 = sizeof(SA);
    
    NSLog(@"size = %ld, %ld, %ld, %ld", a1, a2, a3, a4);   // 12, 8, 8, 16
    
}

- (void)fun3
{
    ss5 s5;
    NSInteger size = sizeof(ss5);
    ss5 *p5 = &s5;
    memset(p5, 0, size);  // 初始化 0000
    
    
    s5.v1 = 0xaa56;
    
    NSData *data = [NSData dataWithBytes:p5 length:size];
    NSLog(@"data = %@", data);
    
    s5.v2 = 0xc9;
    s5.v3 = 0xb8;
    s5.v4 = 0xd7;
    s5.v5 = 0xe1e2e3e4;
    
    data = [NSData dataWithBytes:p5 length:size];
    NSLog(@"data = %@", data);

}

- (void)fun2
{
    int b1 = sizeof(short);
    int b2 = sizeof(char);
    int b3 = sizeof(DZH_DATAHEAD);
    int b4 = sizeof(int);
    int b5 = 0;
    int b6 = 0;
    NSLog(@"size = %d, %d, %d, %d", b1, b2, b3, b4);  // 2, 1, 8, 4
    
    b1 = sizeof(ss1);
    b2 = sizeof(ss2);
    b3 = sizeof(ss3);
    b4 = sizeof(ss4);
    b5 = sizeof(ss5);
    b6 = sizeof(ss6);
    NSLog(@"size = %d, %d, %d, %d, %d, %d", b1, b2, b3, b4, b5, b6);  // 2, 4, 8, 8, 12, 12
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
    NSLog(@"a1 = %ld", (long)a1);
    
    self->m1 = p1->type;
    
    NSLog(@"m1 = %d", self->m1);
    
    
    
    
}





@end

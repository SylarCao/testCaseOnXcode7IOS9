//
//  CPlusVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/12.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "CPlusVCTL.h"
#import "CMMFile.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface CPlusVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation CPlusVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self fun1];
}

- (IBAction)btn1:(id)sender
{
//    [self fun2];
    
    
//    [self fun3];
    
//    [self fun4];
    
    [self fun5];
}

- (void)fun5
{
    char c1 = 'a';
    char c2 = '\r';
    char c3 = '\n';
    
    NSLog(@"char = %d, %d, %d", c1, c2, c3);  // 97, 13, 10
    
}

- (void)fun4
{
    int aa[10] = {1, 2, 11, '{', '}'};
    
    for (int i=0; i<10; i++)
    {
        NSLog(@"i%d = %d", i, aa[i]);
    }
    
    NSLog(@"end-----------");
}

- (void)fun3
{
    const char *c1 = "abcdefg";
    
    char buf[10];
    
    snprintf(buf, 10, "1234567");
    
    NSLog(@"c1 = %s", buf);
    
    
}


- (void)fun2
{
    CMMFile *mm = [[CMMFile alloc] init];

    [mm cppFun1];
}

- (void)fun1
{
//    printf("1 "    "2 " "3 " "4 ");
//    printf("\n------\n");
//    printf("1 2 3 4");
    
    // 1
    printf("1234");
    
    printf("\n------\n");
    
    // 2
    printf("%d%d%d%d", 1,2,3,4);
    
    printf("\n------\n");
    
    //3
    printf("1");
    printf("2");
    printf("3");
    printf("4");
}








@end

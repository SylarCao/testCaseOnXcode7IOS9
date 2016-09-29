//
//  TRYVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/9/29.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TRYVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TRYVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TRYVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fun1];
}

- (void)fun1
{
    NSArray *aa = @[@"1", @"2", @"3"];
    NSInteger count = 4;
    @try {
        for (int i=0; i<count; i++)
        {
            NSLog(@"index%d = %@", i, aa[i]);
        }
    } @catch (NSException *exception) {
        NSLog(@"catch = %@", exception);
        NSLog(@"exception = %@, %@, %@", exception.name, exception.reason, exception.userInfo);
    } @finally {
        NSLog(@"abc");
    }
    
    NSLog(@"end----");
}

@end

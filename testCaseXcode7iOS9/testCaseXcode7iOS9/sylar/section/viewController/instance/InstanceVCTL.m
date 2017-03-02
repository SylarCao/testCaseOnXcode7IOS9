//
//  InstanceVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/3/2.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "InstanceVCTL.h"
#import "InstanceTypeObj1.h"
#import "InstanceTypeObj2.h"

@interface InstanceVCTL ()

@end

@implementation InstanceVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fun1];
    
}

- (void)fun1 {
    
    InstanceTypeObj1 *a = [[InstanceTypeObj1 alloc] initWithValue1:1];
    NSString *a1 = [a returnArrayFun1];
    
    InstanceTypeObj2 *b = [[InstanceTypeObj2 alloc] initWithValue2:2];
    NSString *b1 = [b returnArrayFun1];
    
    
    NSString *s1 = [InstanceTypeObj1 obj1STFun1];
    
    NSString *s2 = [InstanceTypeObj2 obj2STFun1];
    
    
}

@end

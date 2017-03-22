//
//  LogAddressVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/3/22.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "LogAddressVCTL.h"

@interface LogAddressVCTL ()

@property (nonatomic, strong) NSString *value1;
@property (nonatomic, strong) UIColor *value2;
@property (nonatomic, strong) NSMutableArray *arr1;
@property (nonatomic, copy) NSMutableArray *arr2;

@end

@implementation LogAddressVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fun1];
    
    
    
}

- (void)fun1 {
    NSString *s1 = @"abcdefg";
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
    self.value1 = s1;
    self.value2 = s1;  // warning
    self.arr1 = s1;    // warning
    self.arr2 = s1;    // warning
    
    NSLog(@"sylar :  address = %p, %p, %p, %p, %p", s1, self.value1, self.value2, self.arr1, self.arr2);  // 5个地址都一样
    
#pragma clang diagnostic pop
}



@end

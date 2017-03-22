//
//  InstanceTypeObj2.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/3/2.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "InstanceTypeObj2.h"

@implementation InstanceTypeObj2

+ (instancetype)obj2STFun1 {
    return [[self alloc] initWithValue2:2];
}

- (instancetype)initWithValue2:(NSInteger)value {
    self = [super init];
    if (self) {
        NSLog(@"sylar :  initWithValue2");
    }
    return self;
}

- (void)obj2Fun1 {
    NSLog(@"sylar :  obj2Fun1");
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
- (instancetype)returnArrayFun1 {
    NSArray *a = @[@"1", @"2"];
    return a;  // warning
}

#pragma clang diagnostic pop

@end

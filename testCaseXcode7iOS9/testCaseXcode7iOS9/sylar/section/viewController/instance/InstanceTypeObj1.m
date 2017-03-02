//
//  InstanceTypeObj1.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/3/2.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "InstanceTypeObj1.h"

@implementation InstanceTypeObj1

+ (id)obj1STFun1 {
    return [[self alloc] initWithValue1:1];
}

- (id)initWithValue1:(NSInteger)value {
    self = [super init];
    if (self) {
        NSLog(@"sylar :  initWithValue1");
    }
    return self;
}

- (void)obj1Fun1 {
    NSLog(@"sylar :  obj1Fun");
}

- (id)returnArrayFun1 {
    NSArray *a = @[@"1", @"2"];
    return a;
}

@end

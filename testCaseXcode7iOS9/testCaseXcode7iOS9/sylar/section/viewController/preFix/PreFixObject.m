//
//  PreFixObject.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/6/22.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import "PreFixObject.h"

@implementation PreFixObject

+ (void) fun1
{
    NSLog(@"fun11");
}

+ (void)fun2
{
    NSLog(@"fun 22");
}

+ (NSInteger)doubleValue:(NSInteger)value
{
    NSInteger rt = value *2;
    return rt;
    
}

@end

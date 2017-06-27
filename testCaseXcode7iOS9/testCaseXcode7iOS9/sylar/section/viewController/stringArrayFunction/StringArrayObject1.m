//
//  StringArrayObject1.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/6/27.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "StringArrayObject1.h"

@implementation StringArrayObject1

- (void)dealloc {
    NSLog(@"sylar :  StringArrayObject1 dealloc");
}

- (BOOL)checkValue:(NSString *)value key:(NSString *)key{
    BOOL rt = YES;
    if ([key isEqualToString:@"5"]) {
        rt = NO;
    }
    return rt;
}

@end

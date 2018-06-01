//
//  Swizzle.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/6/1.
//  Copyright © 2018年 sylar. All rights reserved.
//

#import "Swizzle.h"
#import <objc/runtime.h>

@implementation Swizzle

+ (void)swizzleClass:(Class)class method:(NSString*)methodName {
    
    SEL originalSelector = NSSelectorFromString(methodName);
    SEL newSelector = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"override_", methodName]);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method newMethod = class_getInstanceMethod(class, newSelector);
    
    method_exchangeImplementations(originalMethod, newMethod);
}

@end

//
//  Swizzle.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/6/1.
//  Copyright © 2018年 sylar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Swizzle : NSObject

/**
 Swizzle the given method so that it is replaced with a method
 named 'override_methodName'.
 */
+ (void)swizzleClass:(Class)class method:(NSString*)methodName;

@end

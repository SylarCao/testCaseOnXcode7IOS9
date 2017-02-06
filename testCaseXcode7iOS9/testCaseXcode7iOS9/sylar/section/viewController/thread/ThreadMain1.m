//
//  ThreadMain1.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/1/18.
//  Copyright © 2017年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ThreadMain1.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ThreadMainObject

- (void)dealloc {
    NSLog(@"sylar :  dealloc ThreadMainObject");
}

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ThreadMain1

+ (instancetype)share {
    static ThreadMain1 *inst = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        inst = [[ThreadMain1 alloc] init];
    });
    return inst;
}

- (void)fun1 {
    [self funS1];
    [self funS2];
    
    
}

- (void)funS1 {
    ThreadMainObject *obj = [[ThreadMainObject alloc] init];
    NSString *s1 = @"abcdefghijklmn";
    NSLog(@"sylar :  s1 = %@", s1);  // abcdefghijklmn
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"sylar :  main queue  1111");
    });
    
    s1 = [s1 substringToIndex:s1.length/2];
    NSLog(@"sylar :  s1 = %@", s1);  // abcdefg
    obj.value = s1;
    
    [self performSelectorOnMainThread:@selector(pFun1:) withObject:obj waitUntilDone:NO];  // different result with waitUntilDone
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // always before pFun1
        NSLog(@"sylar :  main queue  222 = %@", obj.value);
    });
    
    s1 = [s1 substringToIndex:s1.length/2];
    NSLog(@"sylar :  s1 = %@", s1);  // abc
    obj.value = s1;
}

- (void)funS2 {
    NSLog(@"sylar :  s2");
}

- (void)pFun1:(id)sender {
    if ([sender isKindOfClass:[ThreadMainObject class]]) {
        NSLog(@"sylar :  ThreadMainObject = %@", [(ThreadMainObject *)sender value]);
    } else {
        NSLog(@"sylar :  not ThreadMainObject");
    }
}


@end

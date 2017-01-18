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
    NSLog(@"sylar :  s1 = %@", s1);
    
    s1 = [s1 substringToIndex:s1.length/2];
    NSLog(@"sylar :  s1 = %@", s1);
    obj.value = s1;
    
    [self performSelectorOnMainThread:@selector(pFun1:) withObject:obj waitUntilDone:YES];  // different result with waitUntilDone
    
    s1 = [s1 substringToIndex:s1.length/2];
    NSLog(@"sylar :  s1 = %@", s1);
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

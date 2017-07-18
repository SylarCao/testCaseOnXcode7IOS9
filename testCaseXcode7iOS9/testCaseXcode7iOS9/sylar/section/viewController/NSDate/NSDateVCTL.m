//
//  NSDateVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/7/18.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "NSDateVCTL.h"

@interface NSDateVCTL ()

@end

@implementation NSDateVCTL

- (IBAction)btn1Action:(id)sender {
    [self fun1];
}

- (void)fun1 {
    NSString *s1 = @"07/08";
    NSDateFormatter *ff = [[NSDateFormatter alloc] init];
    ff.dateFormat = @"MM/dd";
    NSDate *d1 = [ff dateFromString:s1];
    
    NSTimeInterval t1 = [d1 timeIntervalSince1970];
    
    NSLog(@"sylar :  t1 = %ld", (long)t1);  // 2000-07-08
    
    
}

@end

//
//  MD5VCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/3/17.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "MD5VCTL.h"
#import "NSString+MD5.h"

@interface MD5VCTL ()

@end

@implementation MD5VCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fun1];
}

- (void)fun1 {
    NSString *s1 = @"abc123";
    NSString *m5 = [s1 md5];
    NSLog(@"sylar :  m5 = %@", m5);
    // d807b10f3e500d8c75783703bc47a68e (caojiye)
    // e99a18c428cb38d5f260853678922e03 (abc123)
    
    NSString *base64 = [s1 base64];
    NSLog(@"sylar :  base64 = %@", base64);
    // Y2Fvaml5ZQ== (caojiye)
    // YWJjMTIz (abc123)
}

@end

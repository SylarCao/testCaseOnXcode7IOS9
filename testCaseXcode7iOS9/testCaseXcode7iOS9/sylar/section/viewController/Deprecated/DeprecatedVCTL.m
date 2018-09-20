//
//  DeprecatedVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/9/20.
//  Copyright © 2018年 sylar. All rights reserved.
//

#import "DeprecatedVCTL.h"
#import "DeprecatedObject1.h"

@interface DeprecatedVCTL ()

@end

@implementation DeprecatedVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fun1];
}

- (void)fun1 {
    DeprecatedObject1 *aa = [[DeprecatedObject1 alloc] init];
    [aa fun1];
    [aa fun2];
}

- (void)fun2 {
    
}

@end

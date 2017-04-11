//
//  PropertyOC2.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/4/11.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "PropertyOC2.h"

@implementation PropertyOC2

- (void)dealloc {
    NSLog(@"sylar :  dealloc PropertyOC2");
}

- (void)show {
    NSLog(@"sylar :  PropertyOC1 = %ld monkey2(%ld)  snake3(%ld)", _value1, _monkey2, _snake3);
}


@end

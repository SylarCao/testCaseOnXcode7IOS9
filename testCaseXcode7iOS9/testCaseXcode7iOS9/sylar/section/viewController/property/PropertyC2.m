//
//  PropertyC2.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/4/11.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "PropertyC2.h"

@implementation PropertyC2

- (void)dealloc {
    NSLog(@"sylar :  dealloc PropertyC2");
}

- (void)show {
    NSLog(@"sylar :  PropertyC1 = %ld apple2(%ld)  pear3(%ld)", self->number, self->apple2, self->pear3);
}


@end

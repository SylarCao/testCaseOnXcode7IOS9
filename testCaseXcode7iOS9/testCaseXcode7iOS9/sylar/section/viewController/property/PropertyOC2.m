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

- (id)init {
    self = [super init];
    if (self) {
        _value1 = 24;
        _monkey2 = 34;
        _snake3 = 89;
    }
    return self;
}

- (void)show {
    NSLog(@"sylar :  PropertyOC1 = %ld monkey2(%ld)  snake3(%ld)", _value1, _monkey2, _snake3);
}


@end

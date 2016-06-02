//
//  StringArrayHelper.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/24.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import "StringArrayHelper.h"

NSString *const constStringArrayHelper1 = @"constStringArrayHelper1";

@implementation StringArrayHelper

- (id)initWithData:(NSInteger)p1
{
    self = [super init];
    if (self)
    {
        _p1 = [NSString stringWithFormat:@"%ld", p1];
    }
    return self;
}

@end

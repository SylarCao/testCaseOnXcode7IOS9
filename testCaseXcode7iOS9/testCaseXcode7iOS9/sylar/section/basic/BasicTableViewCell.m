//
//  BasicTableViewCell.m
//  testCase
//
//  Created by sylar on 15/9/21.
//  Copyright (c) 2015年 sylar. All rights reserved.
//

#import "BasicTableViewCell.h"

@implementation BasicTableViewCell

+ (NSString *) getCellId
{
    NSString *rt = NSStringFromClass([self class]);
    return rt;
}

@end

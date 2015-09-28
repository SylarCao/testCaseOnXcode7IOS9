//
//  Helper.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/9/25.
//  Copyright © 2015年 sylar. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+ (instancetype) share
{
    static Helper *inst = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        inst = [[Helper alloc] init];
    });
    return inst;
}

- (UIColor *) getRandomColor
{
    NSInteger r = arc4random()%250;
    NSInteger g = arc4random()%250;
    NSInteger b = arc4random()%250;
    
    UIColor *rt = [UIColor colorWithRed:r/255.9 green:g/255.9 blue:b/255.9 alpha:1];
    return rt;
}

@end

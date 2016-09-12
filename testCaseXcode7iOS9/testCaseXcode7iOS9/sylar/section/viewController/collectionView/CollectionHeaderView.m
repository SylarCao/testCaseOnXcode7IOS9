//
//  CollectionHeaderView.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/9/12.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import "CollectionHeaderView.h"

@implementation CollectionHeaderView

+ (NSString *) getCellId
{
    NSString *rt = NSStringFromClass([self class]);
    return rt;
}

@end

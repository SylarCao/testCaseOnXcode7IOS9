//
//  BasicCollectionViewCell.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/12.
//  Copyright © 2015年 sylar. All rights reserved.
//

#import "BasicCollectionViewCell.h"

@implementation BasicCollectionViewCell

+ (NSString *) getCellId
{
    NSString *rt = NSStringFromClass([self class]);
    return rt;
}

@end

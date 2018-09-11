//
//  ConstraintView2.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/9/11.
//  Copyright © 2018年 sylar. All rights reserved.
//

#import "ConstraintView2.h"

@implementation ConstraintView2

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"sylar : layoutSubviews = %f", self.frame.size.width);
}

@end

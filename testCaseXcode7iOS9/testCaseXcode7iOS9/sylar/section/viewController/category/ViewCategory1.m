//
//  ViewCategory1.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/22.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ViewCategory1.h"
#import <objc/runtime.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
# define kV1  @"ViewCategory1_v1"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIView (ViewCategory1)


- (void)showRedView
{
    if (self.v1 == nil)
    {
        UIView *vv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height)];
        vv.backgroundColor = [UIColor redColor];
        [self addSubview:vv];
        self.v1 = vv;
    }
    
    self.v1.hidden = NO;
}

- (void)hideRedView
{
    self.v1.hidden = YES;
}



#pragma mark - self property
- (UIView *)v1{
    return objc_getAssociatedObject(self, kV1);
}

- (void)setV1:(UIView *)v1 {
    objc_setAssociatedObject(self, kV1, v1, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



@end

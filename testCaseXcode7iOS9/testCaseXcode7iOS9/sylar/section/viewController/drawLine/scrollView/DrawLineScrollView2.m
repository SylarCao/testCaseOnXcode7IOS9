//
//  DrawLineScrollView2.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/9/14.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "DrawLineScrollView2.h"
#import "Masonry.h"

@implementation DrawLineScrollView2

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();

    UIColor *aColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.3];
    CGContextSetFillColor(context, CGColorGetComponents(aColor.CGColor));
    CGContextFillRect(context, CGRectMake(10, 10, rect.size.width - 20, rect.size.height/4));
}

@end

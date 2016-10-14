//
//  DrawBazView.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/10/14.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import "DrawBazView.h"

@implementation DrawBazView

- (void)drawRect:(CGRect)rect
{
    // 股票分时图
    [self fun1];
    
}

- (void)fun1
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *c1 = [UIColor redColor];
    UIColor *c2 = [UIColor blueColor];
    UIColor *c3 = [UIColor yellowColor];
    UIColor *c4 = [UIColor clearColor];
    UIColor *c5 = [UIColor colorWithRed:0.5 green:0.3 blue:0.1 alpha:0.3];
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    

    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    
    CGContextSetStrokeColor(context, CGColorGetComponents(c1.CGColor));
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 10, height/2);
    
    NSInteger count = 20;
    CGPoint points[count];
    
    for (int i=0; i<count; i++)
    {
        NSInteger ran = arc4random()%20;
        CGFloat y = height/2+ran;
        CGContextAddLineToPoint(context, 10+width/30*(i+1), y);
    }
    
    CGPathRef path = CGContextCopyPath(context);   // path 可以保存
    CGContextStrokePath(context);
    
    CGContextAddPath(context, path);
    CGContextAddLineToPoint(context, 10+width/30*(count), height);
    CGContextAddLineToPoint(context, 10, height);
    CGContextClosePath(context);
    
    CGContextSetFillColor(context, CGColorGetComponents(c5.CGColor));
    CGContextFillPath(context);
    
 
}

@end

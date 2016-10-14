//
//  DrawView3.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/9/6.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "DrawView3.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DrawView3()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DrawView3




- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPoint points2[2];  // 画直线用的2个point
    UIColor *aColor = [UIColor redColor];
    UIColor *aColor2 = [UIColor blueColor];
    CGRect rr = CGRectZero;
    
    // 画1根 参考的线条
    points2[0] = CGPointMake(2, 2);
    points2[1] = CGPointMake(198, 2);
    CGContextSetStrokeColor(context, CGColorGetComponents(aColor.CGColor));
    CGContextAddLines(context, points2, 2);
    CGContextSetLineWidth(context, 1);
    CGContextStrokePath(context);
    
    // 画2根 参考的线条
    points2[0] = CGPointMake(2, 8);
    points2[1] = CGPointMake(198, 8);
    CGContextSetStrokeColor(context, CGColorGetComponents(aColor.CGColor));
    CGContextAddLines(context, points2, 2);
    CGContextSetLineWidth(context, 4);
    CGContextStrokePath(context);
    
    // 画3根 参考的线条
    points2[0] = CGPointMake(2, 1);
    points2[1] = CGPointMake(198, 1);
    CGContextSetStrokeColor(context, CGColorGetComponents(aColor2.CGColor));
    CGContextAddLines(context, points2, 2);
    CGContextSetLineWidth(context, 0.5);
    CGContextStrokePath(context);
    
    // 画4根 参考的线条
    points2[0] = CGPointMake(2, 3.25);
    points2[1] = CGPointMake(198, 3.25);
    CGContextSetStrokeColor(context, CGColorGetComponents(aColor2.CGColor));
    CGContextAddLines(context, points2, 2);
    CGContextSetLineWidth(context, 0.5);
    CGContextStrokePath(context);
    
    // 画空心矩形
    rr = CGRectMake(4, 20, 10, 10);
    CGContextSetStrokeColor(context, CGColorGetComponents(aColor.CGColor));
    CGContextSetLineWidth(context, 0.5);
    CGContextStrokeRect(context, rr);
    
    rr = CGRectMake(20.5, 20, 10, 10);
    CGContextSetStrokeColor(context, CGColorGetComponents(aColor.CGColor));
    CGContextSetLineWidth(context, 0.5);
    CGContextStrokeRect(context, rr);
    
    rr = CGRectMake(40.25, 20, 10, 10);
    CGContextSetStrokeColor(context, CGColorGetComponents(aColor.CGColor));
    CGContextSetLineWidth(context, 0.5);
    CGContextStrokeRect(context, rr);
    
    
    // 画空心矩形
    rr = CGRectMake(4, 40, 10, 10);
    CGContextSetStrokeColor(context, CGColorGetComponents(aColor2.CGColor));
    CGContextSetLineWidth(context, 1);
    CGContextStrokeRect(context, rr);
    
    rr = CGRectMake(20, 40, 10, 10);
    CGContextSetStrokeColor(context, CGColorGetComponents(aColor2.CGColor));
    CGContextSetLineWidth(context, 2);
    CGContextStrokeRect(context, rr);
    
    // 实心矩形
    rr = CGRectMake(40, 40, 10, 10);
    CGContextSetFillColor(context, CGColorGetComponents(aColor.CGColor));
    CGContextFillRect(context, rr);
    
    // UIBezierPath 不规则图形
//    CGContextSetStrokeColor(context, CGColorGetComponents(aColor.CGColor));
//    CGContextSetFillColor(context, CGColorGetComponents(aColor2.CGColor));
//    UIBezierPath *aPath = [UIBezierPath bezierPath];
//    [aPath moveToPoint:CGPointMake(100.0, 0.0)];
//    [aPath addLineToPoint:CGPointMake(200.0, 40.0)];
//    [aPath addLineToPoint:CGPointMake(160, 140)];
//    [aPath addLineToPoint:CGPointMake(40.0, 140)];
//    [aPath addLineToPoint:CGPointMake(0.0, 40.0)];
//    [aPath closePath];
//    [aPath stroke];
//    [aPath fill];
    
    // UIBezierPath  和上边的一样
//    CGContextSetStrokeColor(context, CGColorGetComponents(aColor.CGColor));
//    CGContextSetFillColor(context, CGColorGetComponents(aColor2.CGColor));
//    CGContextBeginPath(context);
//    CGContextMoveToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, 50, 50);
//    CGContextAddLineToPoint(context, 50, 100);
//    CGContextAddLineToPoint(context, 0, 80);
//    CGContextClosePath(context);
//    CGContextDrawPath(context, kCGPathFillStroke);  // 这句话必须加
//    CGContextFillPath(context);
//    CGContextStrokePath(context);

}



@end

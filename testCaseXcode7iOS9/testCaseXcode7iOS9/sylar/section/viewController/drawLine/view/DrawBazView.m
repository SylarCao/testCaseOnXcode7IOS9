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
    
    // data
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    
    NSInteger count = 20;
    CGPoint points[count];
    
    for (int i=0; i<count; i++)
    {
        NSInteger ran = arc4random()%20;
        CGFloat y = height/2+ran;
        CGPoint pp = CGPointMake(10+width/30*i, y);
        points[i] = pp;
    }
    
    CGContextSetStrokeColor(context, CGColorGetComponents(c1.CGColor));
    CGContextSetFillColor(context, CGColorGetComponents(c5.CGColor));
    CGContextAddLines(context, points, count);
    CGContextStrokePath(context);
    
//    CGContextSetStrokeColor(context, CGColorGetComponents(c2.CGColor));
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 10+width/30*count, height);
    CGContextAddLineToPoint(context, 10, height);
    CGContextAddLineToPoint(context, 10, height/2);
//    CGContextClosePath(context);
    
//    CGContextDrawPath(context, kCGPathFillStroke);
    CGContextFillPath(context);
//    CGContextStrokePath(context);
    
    
    
//    // Set the starting point of the shape.
//    [aPath moveToPoint:CGPointMake(100.0, 0.0)];
//    
//    // Draw the lines.
//    [aPath addLineToPoint:CGPointMake(200.0, 40.0)];
////    [aPath stroke];
//    CGContextSetStrokeColor(context, CGColorGetComponents(c2.CGColor));
//    [aPath addLineToPoint:CGPointMake(160, 140)];
//    [aPath addLineToPoint:CGPointMake(40.0, 140)];
//    [aPath addLineToPoint:CGPointMake(0.0, 40.0)];
//    [aPath closePath];
//    
////    [aPath stroke];
//    CGContextDrawPath(context, kCGPathStroke);
    
}

@end

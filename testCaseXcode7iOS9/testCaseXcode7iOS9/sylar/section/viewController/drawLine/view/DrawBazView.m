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
    
    [self fun1];
    
//    [self fun2];
    
//    [self fun3];
    
}

- (void)fun3
{
    // 自己画一个 渐变的颜色 有形状
    
    CGSize size = self.frame.size;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // path
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, size.width/2 , 50);
    CGContextAddLineToPoint(context, 10, size.height-20);
    CGContextAddLineToPoint(context, size.width-10, size.height-20);
    CGContextClosePath(context);
    CGContextClip(context);   // 下边的颜色填充就在context的path里
    
    // color
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[3] = {0, 0.5, 1};
    CGFloat components[12] = {1, 0, 0, 1, 0, 0, 1, 0.3, 0, 1, 0, 1}; // red(1) -> blue(0.3) -> green(1)
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 3);
    
    CGPoint startPoint = CGPointMake(size.width/2, 50);
    CGPoint endPoint = CGPointMake(size.width, size.height-20);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation);
}


- (void)fun2
{
    // 网上抄的一个例子
    CGRect bounds = self.bounds;
    CGPoint center;
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    }
    
    path.lineWidth = 10;
    [[UIColor lightGrayColor] setStroke];
    
    [path stroke];
    
    
    // start...
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    // 2、绘制渐变
    // 2.1绘制三角形
//    UIBezierPath *myPath = [UIBezierPath bezierPath];
//    [myPath moveToPoint:CGPointMake(160, 142)];
//    [myPath addLineToPoint:CGPointMake(260, 446)];
//    [myPath moveToPoint:CGPointMake(260, 446)];
//    [myPath addLineToPoint:CGPointMake(60, 446)];
//    [myPath moveToPoint:CGPointMake(60, 446)];
//    [myPath addLineToPoint:CGPointMake(160, 142)];
//    [myPath stroke];
    
    UIBezierPath *myPath = [UIBezierPath bezierPath];
    [myPath moveToPoint:CGPointMake(160, 142)];
    [myPath addLineToPoint:CGPointMake(260, 446)];
    [myPath addLineToPoint:CGPointMake(60, 446)];
    [myPath addLineToPoint:CGPointMake(160, 142)];
    [myPath stroke];

    
    CGContextSaveGState(currentContext);
    
    [myPath addClip];
    
    // 为myPath填充渐变
    
    // 为什么三角形没有填充渐变？
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {1.0, 1.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0}; // yellow->red
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    
    CGPoint startPoint = CGPointMake(160, 142);
    CGPoint endPoint = CGPointMake(160, 446);
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    CGContextRestoreGState(currentContext);
    
    
    
    // 1、绘制阴影
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 2);
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    [logoImage drawInRect:CGRectMake(80, 142, self.window.frame.size.width / 2.0, self.window.frame.size.height / 2.0)];
    
    CGContextRestoreGState(currentContext);
    
    // end...
}

- (void)fun1
{
    // 股票分时图
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *c1 = [UIColor redColor];
    UIColor *c2 = [UIColor blueColor];
    UIColor *c3 = [UIColor yellowColor];
    UIColor *c4 = [UIColor clearColor];
    UIColor *c5 = [UIColor colorWithRed:0.5 green:0.3 blue:0.1 alpha:0.3];
//    UIBezierPath *aPath = [UIBezierPath bezierPath];
    

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

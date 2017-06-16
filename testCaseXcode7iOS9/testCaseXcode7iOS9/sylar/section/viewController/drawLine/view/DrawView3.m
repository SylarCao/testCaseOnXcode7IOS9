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
    NSDictionary *attribute = nil;
    
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
    
    // UIBezierPath 不规则图形  // 见 DrawBazView
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
    
    // UIBezierPath  和上边的一样   // 见 DrawBazView
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
    
    // text
    NSString *s1 = @"abcdefg";
    [s1 drawAtPoint:CGPointMake(10, 60) withAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    
    [s1 drawInRect:CGRectMake(60, 60, 40, 20) withAttributes:@{NSForegroundColorAttributeName: [UIColor redColor], NSBackgroundColorAttributeName: [UIColor yellowColor]}];
    
//    [s1 drawWithRect:<#(CGRect)#> options:<#(NSStringDrawingOptions)#> attributes:<#(nullable NSDictionary<NSString *,id> *)#> context:<#(nullable NSStringDrawingContext *)#>]
    
    // 虚线
    points2[0] = CGPointMake(2, 88);
    points2[1] = CGPointMake(100, 88);
    CGContextAddLines(context, points2, 2);
    CGFloat dashLength[] = {4,1};
    CGContextSetLineDash(context, 0, dashLength , 2);
    CGContextStrokePath(context);
    
    // 取消虚线
    points2[0] = CGPointMake(2, 92);
    points2[1] = CGPointMake(100, 92);
    CGContextAddLines(context, points2, 2);
    CGContextSetLineDash(context, 0, nil, 0);
    CGContextStrokePath(context);
    
    // 画圆圈
    CGContextSetStrokeColor(context, CGColorGetComponents(aColor.CGColor));
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 120) radius:10 startAngle:0 endAngle:M_PI clockwise:YES];
    CGContextAddPath(context, path.CGPath);
    CGContextStrokePath(context);
    
    // 有圆角的矩形
    rr = CGRectMake(10, 140, 40, 30);
    CGContextSetStrokeColor(context, CGColorGetComponents(aColor.CGColor));
    CGContextSetLineWidth(context, 1);
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGPathAddRoundedRect(pathRef, nil, rr, 5, 5);
    CGContextAddPath(context, pathRef);
    CGContextStrokePath(context);
    
    // 没圆角的矩形
    rr = CGRectMake(100, 149, 40, 30);
    CGContextAddRect(context, rr);
    CGContextStrokePath(context);
    
    // draw text 增加高度和宽度
    rr = CGRectMake(30, 200, 180, 40);
    aColor = [UIColor yellowColor];
    CGContextSetFillColor(context, CGColorGetComponents(aColor.CGColor));
    CGContextFillRect(context, rr);  // 黄色背景
    s1 = @"abcde";
    NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc] init];
    style.minimumLineHeight = rr.size.height;
    style.headIndent = 6;
    style.firstLineHeadIndent = 3;
    style.tailIndent = rr.size.width - 3;
    style.alignment = NSTextAlignmentCenter;
    NSNumber *n = [NSNumber numberWithFloat:rr.size.height/2];
    attribute = @{NSForegroundColorAttributeName: [UIColor redColor], NSBackgroundColorAttributeName: [UIColor greenColor], NSParagraphStyleAttributeName: style, NSBaselineOffsetAttributeName: n};
//    [s1 drawInRect:rr withAttributes:attribute];
    
    // attribute string 后边跟一张图片
    NSMutableAttributedString *mm = [[NSMutableAttributedString alloc] initWithString:@""];
    NSDictionary *a1 = @{NSForegroundColorAttributeName: [UIColor redColor], NSBaselineOffsetAttributeName: n, NSParagraphStyleAttributeName: style};
    NSMutableAttributedString *m1 = [[NSMutableAttributedString alloc] initWithString:@"123 " attributes:a1];
    NSDictionary *a2 = @{NSForegroundColorAttributeName: [UIColor greenColor], NSBaselineOffsetAttributeName: n, NSParagraphStyleAttributeName: style};
    NSMutableAttributedString *m2 = [[NSMutableAttributedString alloc] initWithString:@"abc" attributes:a2];
    NSTextAttachment *tt = [[NSTextAttachment alloc] init];
    UIImage *image6 = [UIImage imageNamed:@"sgs6px"];
    tt.image = image6;
    NSAttributedString *m3 = [NSAttributedString attributedStringWithAttachment:tt];
    [mm appendAttributedString:m1];
    [mm appendAttributedString:m2];
    [mm appendAttributedString:m3];
    [mm drawInRect:rr];
    
    
    
}



@end

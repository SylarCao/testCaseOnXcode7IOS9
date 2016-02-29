//
//  DrawView1.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/10.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "DrawView1.h"
#import "Helper.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DrawView1()
{
    CGPoint m_points[600];
}

@property (nonatomic, assign) NSInteger mPointsCount;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DrawView1

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setWithInitialValue];
    }
    return self;
}

- (void)setWithInitialValue
{
    self.backgroundColor = [UIColor whiteColor];
    [self addALabel];
    
//    [self setWithMPoints];
    
    [self setWithPublicTestValue];
    
}

- (void)setWithPublicTestValue
{
    _lineX = 100;
    _lineYStart = 20;
    _lineYEnd = 250;
    _imageRect = CGRectMake(150, 100, 120, 120);
}

- (void)setWithMPoints
{
    // 画很多很多个点
    _mPointsCount = 600;
    for (int i=0; i<_mPointsCount; i++)
    {
        NSInteger x = arc4random()%200 + 50;
        NSInteger y = arc4random()%50 + 25;
        m_points[i] = CGPointMake(x, y);
    }
}

- (void)addALabel
{
    UILabel *lb1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    lb1.text = @"label 1";
    lb1.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.3];
    [self addSubview:lb1];
}

- (void)publicFun1
{
    [self setNeedsDisplay];
}

- (void)publicFun2:(CGRect)rect
{
    [self setNeedsDisplayInRect:rect];  // 就画这个rect里的东西，有性能优化
//    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
//    CGContextRef gc = UIGraphicsGetCurrentContext();
//    [self fun1:gc color:[[Helper share] getRandomColor]];
//    [self drawRect1:gc color:[[Helper share] getRandomColor]];
    
//    [self drawLine1];
//    [self drawLine2];
//    [self drawImage1];
    
//    [self drawDashLine1];
    
    [self drawRect1];
    [self drawLabel];
    [self drawRectOutside];
    
//    // 画好多个点
//    NSTimeInterval time1 = [NSDate timeIntervalSinceReferenceDate];
//    [self drawMPoints];
//    NSTimeInterval time2 = [NSDate timeIntervalSinceReferenceDate];
//    NSLog(@"time = %f", time2-time1);
}

- (void)drawRectOutside
{
    CGContextRef gc = UIGraphicsGetCurrentContext();
    UIColor *aColor = [UIColor greenColor];
    const CGFloat *cg_color = CGColorGetComponents(aColor.CGColor);
    CGContextSetStrokeColor(gc, cg_color);
    CGContextStrokeRect(gc,CGRectMake(250, 100, 100, 100));  //画方框
    
    // 填充矩形颜色
    aColor = [UIColor blueColor];
    cg_color = CGColorGetComponents(aColor.CGColor);
    CGContextSetFillColor(gc, cg_color);
    CGContextFillRect(gc, CGRectMake(250, 100, 100, 100));
}


- (void)drawLine1
{
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    UIColor *aColor = [[Helper share] getRandomColor];
    const CGFloat *cg_color = CGColorGetComponents(aColor.CGColor);
//    CGFloat red = cg_color[0];
//    CGFloat green = cg_color[1];
//    CGFloat blue = cg_color[2];
//    CGFloat alpha = cg_color[3];
//    CGContextSetRGBStrokeColor(gc, red, green, blue, alpha);
    CGContextSetStrokeColor(gc, cg_color);   // 和 CGContextSetRGBStrokeColor 效果一样
    CGContextSetLineWidth(gc, 1);
    CGPoint aPoints[5];
    aPoints[0] =CGPointMake(10, 10);
    aPoints[1] =CGPointMake(260, 60);
    aPoints[2] =CGPointMake(260, 30);
    aPoints[3] =CGPointMake(60, 30);
    aPoints[4] =CGPointMake(60, 60);
    CGContextAddLines(gc, aPoints, 5);
    CGContextStrokePath(gc);
}

- (void)drawLine2
{
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    UIColor *aColor = [[Helper share] getRandomColor];
    const CGFloat *cg_color = CGColorGetComponents(aColor.CGColor);
    CGFloat red = cg_color[0];
    CGFloat green = cg_color[1];
    CGFloat blue = cg_color[2];
    CGFloat alpha = cg_color[3];
    
    CGContextSetRGBStrokeColor(gc, red, green, blue, alpha);
    CGContextSetLineWidth(gc, 4);
    CGPoint aPoints[2];
    aPoints[0] =CGPointMake(_lineX, _lineYStart);
    aPoints[1] =CGPointMake(_lineX, _lineYEnd);
    CGContextAddLines(gc, aPoints, 2);
    CGContextDrawPath(gc, kCGPathStroke); //开始画线
    
}

- (void)drawDashLine1
{
    CGContextRef gc = UIGraphicsGetCurrentContext();
    UIColor *aColor = [[Helper share] getRandomColor];
    CGContextSetStrokeColor(gc, CGColorGetComponents(aColor.CGColor));
    CGPoint aPoints[2];
    aPoints[0] =CGPointMake(10, 60);
    aPoints[1] =CGPointMake(200, 60);
    CGFloat dash[2];
    dash[0] = 10;
    dash[1] = 4;
    CGContextSetLineDash(gc, 0, dash, 2);
    CGContextAddLines(gc, aPoints, 2);
    CGContextStrokePath(gc);
    
}

- (void)drawImage1
{
    UIImage *aImage = [UIImage imageNamed:@"sgs7"];
    
    [aImage drawInRect:_imageRect];
}

- (void)drawMPoints
{
    CGContextRef gc = UIGraphicsGetCurrentContext();
    UIColor *aColor = [UIColor redColor];
    const CGFloat *cg_color = CGColorGetComponents(aColor.CGColor);
    CGFloat red = cg_color[0];
    CGFloat green = cg_color[1];
    CGFloat blue = cg_color[2];
    CGFloat alpha = cg_color[3];
    
    CGContextSetRGBStrokeColor(gc, red, green, blue, alpha);
    CGContextSetLineWidth(gc, 2);
    CGContextAddLines(gc, m_points, _mPointsCount);
    CGContextStrokePath(gc);
    
    
}

- (void)drawRect1
{
    CGContextRef gc = UIGraphicsGetCurrentContext();
    UIColor *aColor = [UIColor redColor];
    const CGFloat *cg_color = CGColorGetComponents(aColor.CGColor);
    CGContextSetStrokeColor(gc, cg_color);
    CGContextStrokeRect(gc,CGRectMake(100, 100, 100, 100));  //画方框
    
    // 填充矩形颜色
    aColor = [UIColor blueColor];
    cg_color = CGColorGetComponents(aColor.CGColor);
    CGContextSetFillColor(gc, cg_color);
    CGContextFillRect(gc, CGRectMake(100, 100, 100, 100));
}

- (void)drawLabel
{
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    UIColor *aColor = [UIColor redColor];
    const CGFloat *cg_color = CGColorGetComponents(aColor.CGColor);
    CGFloat red = cg_color[0];
    CGFloat green = cg_color[1];
    CGFloat blue = cg_color[2];
    CGFloat alpha = cg_color[3];
    CGContextSetRGBStrokeColor(gc, red, green, blue, alpha);
    
    NSString *text = @"文字abcdefgh abcefghijklmnopqr";
    
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentRight;
    
//    NSParagraphStyle *ss = [[NSParagraphStyle alloc] init];
//    ss.alignment = NSTextAlignmentRight;
    
    
    [text drawInRect:CGRectMake(100, 100, 100, 100) withAttributes:@{NSForegroundColorAttributeName: aColor, NSFontAttributeName:[UIFont systemFontOfSize:20], NSParagraphStyleAttributeName: paragraphStyle}];
    
}


#pragma mark - 下边的都是yyz的老代码

- (void)drawRect2:(CGContextRef)gc color:(UIColor *)color
{
    // 实心的矩形
    
}

- (void)drawRect1:(CGContextRef)gc color:(UIColor *)color
{
    // 话一个空心的矩形
    const CGFloat *cg_color = CGColorGetComponents(color.CGColor);
    CGFloat red = cg_color[0];
    CGFloat green = cg_color[1];
    CGFloat blue = cg_color[2];
    CGFloat alpha = cg_color[3];
    
    CGRect rect1 = CGRectMake(20, 20, 80, 40);
    
    CGContextSetRGBStrokeColor(gc, red, green, blue, alpha);
    CGContextStrokeRect(gc,rect1);
    
    
    
    
    return;
    CGContextSaveGState(gc);
    CGContextSetAllowsAntialiasing(gc, YES);
    CGContextSetRGBStrokeColor(gc, red, green, blue, alpha);
    CGContextSetLineWidth(gc, 1.0);
    CGContextAddRect(gc, rect1);
    CGContextStrokePath(gc);
    CGContextFlush(gc);
    CGContextRestoreGState(gc);
}

- (void)fun1:(CGContextRef)gc color:(UIColor *)color
{
    // draw line
    const CGFloat *cg_color = CGColorGetComponents(color.CGColor);
    
    CGFloat red = cg_color[0];
    CGFloat green = cg_color[1];
    CGFloat blue = cg_color[2];
    CGFloat alpha = cg_color[3];
    
    
    CGPoint pt[3];
    
    pt[0].x = 10;
    pt[0].y = 10;
    pt[1].x = 100;
    pt[1].y = 10;
    pt[2].x = 50;
    pt[2].y = 100;
    
    CGFloat dash[2];
    dash[0] = 4;
    dash[1] = 2;
    
    CGContextSaveGState(gc);
    CGContextSetAllowsAntialiasing(gc, YES);
    CGContextSetLineDash(gc, 0, dash, 2);
    CGContextSetRGBStrokeColor(gc, red, green, blue, alpha);
    CGContextSetLineWidth(gc, 1);
    CGContextAddLines(gc, pt, 3);
    CGContextStrokePath(gc);
    CGContextFlush(gc);
    CGContextRestoreGState(gc);
}

@end

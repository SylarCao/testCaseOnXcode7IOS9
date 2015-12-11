//
//  DrawLineVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/9.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "DrawLineVCTL.h"
#import "Gdip.h"
#import "DrawView1.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DrawLineVCTL ()


@property (nonatomic, strong) DrawView1 *view1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DrawLineVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addView1];
    
    [self drawLine1];
}

- (IBAction)btn1:(id)sender
{
//    CGContextRef gc = UIGraphicsGetCurrentContext();
//    UIColor *c1 = [UIColor colorWithRed:0.8 green:0.7 blue:0.5 alpha:0.9];
//    [self fun1:gc color:c1];

//    [_view1 publicFun1];
    
    [_view1 setNeedsDisplay];
    
//    [self test1];
}

- (void)test1
{
    _view1.lineX=110;
    _view1.lineYStart = 10;
    _view1.lineYEnd = 130;
    _view1.imageRect = CGRectMake(120, 150, 100, 100);
    [_view1 publicFun2:CGRectMake(0, 100, _view1.frame.size.width, 100)];
}


- (void)addView1
{
    _view1 = [[DrawView1 alloc] initWithFrame:CGRectMake(10, 100, 300, 400)];
    [self.view addSubview:_view1];
}

- (void)drawLine1
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    [Gdip drawDashLine:context pts:<#(CGPoint *)#> count:<#(int)#> clr:<#(UIColor *)#> width:<#(float)#>]
}

- (void)fun1:(CGContextRef)gc color:(UIColor *)color 
{
    const CGFloat *cg_color = CGColorGetComponents(color.CGColor);
    
    CGFloat red = cg_color[0];
    CGFloat green = cg_color[1];
    CGFloat blue = cg_color[2];
    CGFloat alpha = cg_color[3];
    
    
    CGPoint pt[2];
    
    pt[0].x = 100;
    pt[0].y = 200;
    pt[1].x = 300;
    pt[1].y = 300;
    
    
    CGContextSaveGState(gc);
    CGContextSetAllowsAntialiasing(gc, YES);
    CGContextSetRGBStrokeColor(gc, red, green, blue, alpha);
    CGContextSetLineWidth(gc, 1);
    CGContextAddLines(gc, pt, 2);
    CGContextStrokePath(gc);
    CGContextFlush(gc);
    CGContextRestoreGState(gc);
}

@end

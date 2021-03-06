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
#import "DrawView2.h"
#import "DrawView3.h"
#import "DrawBazView.h"
#import "DrawLineScrollView.h"
#import "DrawLineScrollView2.h"
#import "Masonry.h"
#import "DrawView4.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DrawLineVCTL ()


@property (nonatomic, strong) DrawView1 *view1;

@property (nonatomic, strong) DrawView2 *view2;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DrawLineVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self addView1];
    
//    [self drawLine1];
    
//    [self addDrawView2];
    
//    [self fun1];
    
//    [self fun2];
    
    [self fun3];
    
//    [self fun4];
}

- (IBAction)btn1:(id)sender
{
//    CGContextRef gc = UIGraphicsGetCurrentContext();
//    UIColor *c1 = [UIColor colorWithRed:0.8 green:0.7 blue:0.5 alpha:0.9];
//    [self fun1:gc color:c1];

//    [_view1 publicFun1];
    
//    [_view1 setNeedsDisplay];
    
//    [self test1];
}

- (void)fun4 {
    DrawView4 *v4 = [[DrawView4 alloc] initWithFrame:CGRectMake(10, 100, 300, 400)];
    [self.view addSubview:v4];
}

- (void)fun3 {
    // 8192 -> 这个是 画图的size 不是 view的size
    CGFloat width = 8220;
    UIScrollView * s1 = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 110, 300, 400)];
    [self.view addSubview:s1];
    s1.layer.borderColor = [UIColor redColor].CGColor;
    s1.layer.borderWidth = 1;
    s1.contentSize = CGSizeMake(width, 400);
    
    UINib *nib = [UINib nibWithNibName:@"DrawLineScrollView" bundle:nil];
    DrawLineScrollView *v1 = [[nib instantiateWithOwner:nil options:nil] lastObject];
    v1.frame = CGRectMake(0, 0, width, 400);
    [s1 addSubview:v1];
    
    DrawLineScrollView2 *v2 = [[DrawLineScrollView2 alloc] initWithFrame:CGRectZero];
    [v1 addSubview:v2];
    v2.backgroundColor = [UIColor yellowColor];
    v2.layer.borderWidth = 2;
    v2.layer.borderColor = [UIColor blueColor].CGColor;
    [v2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset = 2;
        make.right.offset = -2;
        make.bottom.offset = -5;
        make.height.offset = 150;
    }];
}

- (void)fun2
{
    DrawBazView *b1 = [[DrawBazView alloc] initWithFrame:CGRectMake(30, 100, 200, 400)];
    b1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:b1];
}

- (void)fun1
{
    DrawView3 *v3 = [[DrawView3 alloc] initWithFrame:CGRectMake(30, 100, 200, 400)];
    v3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:v3];
}

- (void)addDrawView2
{
    _view2 = [[DrawView2 alloc] initWithFrame:CGRectMake(50, 50, 30, 30)];
    _view2.backgroundColor = [UIColor redColor];
    [self.view addSubview:_view2];
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

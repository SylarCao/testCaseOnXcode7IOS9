//
//  DrawView4.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/6/7.
//  Copyright © 2018年 sylar. All rights reserved.
//

#import "DrawView4.h"

@implementation DrawView4

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor redColor];
        
        [self fun1];
//        [self fun2];
        
    }
    return self;
}

- (void)fun1 {
    UIColor *c1 = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];  // UIExtendedSRGBColorSpace 1 1 1 1
    UIColor *c2 = [UIColor lightGrayColor];  // UIExtendedGrayColorSpace 0.666667 1
    UIColor *c3 = [UIColor yellowColor];
    UIColor *c4 = [UIColor redColor];
    UIColor *c5 = [UIColor blackColor];  // UIExtendedGrayColorSpace 0 1
    UIColor *c6 = [UIColor colorWithWhite:0.5 alpha:1];
    
    CGColorRef r1 = c1.CGColor;  // (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1; extended range)] ( 1 1 1 1 )
    CGColorRef r2 = c2.CGColor;  // (kCGColorSpaceICCBased; kCGColorSpaceModelMonochrome; Generic Gray Gamma 2.2 Profile; extended range)] ( 0.666667 1 )
    CGColorRef r3 = c3.CGColor;  // (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1; extended range)] ( 1 1 0 1 )
    CGColorRef r4 = c4.CGColor;  // (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1; extended range)] ( 1 0 0 1 )
    CGColorRef r5 = c5.CGColor;  // (kCGColorSpaceICCBased; kCGColorSpaceModelMonochrome; Generic Gray Gamma 2.2 Profile; extended range)] ( 0 1 )
    CGColorRef r6 = c6.CGColor;  // (kCGColorSpaceICCBased; kCGColorSpaceModelMonochrome; Generic Gray Gamma 2.2 Profile; extended range)] ( 0.5 1 )

    NSInteger i1 = CGColorGetNumberOfComponents(r1);  // 4
    NSInteger i2 = CGColorGetNumberOfComponents(r2);  // 2
    NSInteger i3 = CGColorGetNumberOfComponents(r3);  // 4
    NSInteger i4 = CGColorGetNumberOfComponents(r4);  // 4
    NSInteger i5 = CGColorGetNumberOfComponents(r5);  // 2
    NSInteger i6 = CGColorGetNumberOfComponents(r6);  // 2
    
//    NSLog(@"sylar : aaa = %@", r1);
}

- (void)fun2 {
    
    UIColor *color = [UIColor redColor];
    
    const CGFloat *c = CGColorGetComponents(color.CGColor);
    NSLog(@"sylar : color red = %f, %f, %f, %f", c[0], c[1], c[2], c[3]);  // 1, 0, 0 ,1
    
    color = [UIColor lightGrayColor];
    c = CGColorGetComponents(color.CGColor);
    NSLog(@"sylar : color light gray = %f, %f, %f, %f", c[0], c[1], c[2], c[3]);  // 0.666, 1, 0, 错误数字
    
    color = [UIColor whiteColor];
    c = CGColorGetComponents(color.CGColor);
    NSLog(@"sylar : color white = %f, %f, %f, %f", c[0], c[1], c[2], c[3]);  // 1, 1, 0, 0
}


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
//    [self draw1:context];
    CGContextClearRect(context, rect);
//    [self draw1:context];
    UIColor *color = nil;
    CGPoint points2[2];
    CGRect frame = CGRectZero;
    NSDictionary *aa = nil;
    
    color = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
//    color = [UIColor colorWithWhite:1 alpha:1];
//    color = [UIColor whiteColor];
//    color = [UIColor lightGrayColor];
//    const CGFloat *c = CGColorGetComponents(color.CGColor);
//    NSLog(@"sylar : color  = %f, %f, %f, %f", c[0], c[1], c[2], c[3]);  // 1, 0, 0 ,1
    CGContextSetFillColor(context, CGColorGetComponents(color.CGColor));
//    CGContextSetRGBFillColor(context, 0.66666, 1, -0.00001, 234243);
    CGContextFillRect(context, rect);
//[self draw1:context];
//    color = [UIColor blueColor];
//    CGContextSetFillColor(context, CGColorGetComponents(color.CGColor));
//    CGContextFillRect(context, CGRectMake(rect.origin.x, rect.origin.y, rect.size.width/2, rect.size.height/2));
    
    // draw line
    color = [UIColor blueColor];

    CGContextSetStrokeColor(context, CGColorGetComponents(color.CGColor));
    points2[0] = CGPointMake(rect.origin.x + rect.size.width/4, rect.origin.y);
    points2[1] = CGPointMake(rect.origin.x + rect.size.width/4, rect.origin.y + rect.size.height);
    CGContextAddLines(context, points2, 2);
    points2[0] = CGPointMake(rect.origin.x + rect.size.width/2, rect.origin.y);
    points2[1] = CGPointMake(rect.origin.x + rect.size.width/2, rect.origin.y + rect.size.height);
    CGContextAddLines(context, points2, 2);
    points2[0] = CGPointMake(rect.origin.x + rect.size.width*0.75, rect.origin.y);
    points2[1] = CGPointMake(rect.origin.x + rect.size.width*0.75,  rect.origin.y + rect.size.height);
    CGContextAddLines(context, points2, 2);
    CGContextSetLineWidth(context, 1);
    CGContextStrokePath(context);
    
    // draw text
    NSString *s1 = @"abcdedg";
    frame = CGRectMake(0, 0, rect.size.width/4, 40);
    UIColor *c1 = [UIColor whiteColor];
    c1 = [UIColor lightGrayColor];
//    c1 = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    aa = @{NSForegroundColorAttributeName: c1};
    [s1 drawInRect:frame withAttributes:aa];
    
    // draw line
    color = [UIColor blueColor];
    CGContextSetStrokeColor(context, CGColorGetComponents(color.CGColor));
    points2[0] = CGPointMake(0, 50);
    points2[1] = CGPointMake(rect.size.width*0.75,  50);
    CGContextAddLines(context, points2, 2);
    CGContextSetLineWidth(context, 1);
    CGContextStrokePath(context);
}

- (void)draw1:(CGContextRef)context {
    CGColorSpaceRef rr = CGBitmapContextGetColorSpace(context);
    
    NSLog(@"sylar : rr = %@", rr);
}

@end

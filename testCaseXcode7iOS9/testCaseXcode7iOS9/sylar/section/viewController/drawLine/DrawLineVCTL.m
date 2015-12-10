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
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DrawLineVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DrawLineVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self drawLine1];
    
}

- (void)drawLine1
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    [Gdip drawDashLine:context pts:<#(CGPoint *)#> count:<#(int)#> clr:<#(UIColor *)#> width:<#(float)#>]
}

@end

//
//  LayerVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/9/14.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "LayerVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface LayerVCTL ()


@property (nonatomic, weak) IBOutlet UIView *v1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation LayerVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self fun1];
    
//    [self fun2];
    
//    [self fun3];
    
//    [self fun5];
    
    [self fun6];
    
}

- (void)fun6
{
    
}

- (void)fun5
{
    CAShapeLayer * maskLayer = [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithRoundedRect: _v1.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: (CGSize){15, 15}].CGPath;
    _v1.layer.mask = maskLayer;
}

- (void)fun4
{
    CALayer *ll = [[CALayer alloc] init];
    ll.frame = CGRectMake(0, 0, 50, 50);
    ll.borderWidth = 2;
    ll.borderColor = [UIColor blueColor].CGColor;
    
    [_v1.layer addSublayer:ll];
}

- (void)fun3
{
    CALayer *ll = [[CALayer alloc] init];
    ll.frame = CGRectMake(0, 0, 50, 4);
    ll.borderWidth = 2;
    ll.borderColor = [UIColor blueColor].CGColor;
    
    [_v1.layer addSublayer:ll];
}

- (void)fun1
{
    
    _v1.layer.borderColor = [UIColor blueColor].CGColor;
    _v1.layer.borderWidth = 2;
    
}

- (void)fun2
{
    _v1.layer.borderColor = [UIColor blueColor].CGColor;
    _v1.layer.borderWidth = 2;
    _v1.layer.cornerRadius = 20;
}





@end

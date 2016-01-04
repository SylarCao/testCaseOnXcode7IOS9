//
//  HorizontalView.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/28.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "HorizontalView.h"
#import "Helper.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface HorizontalView()

@property (nonatomic, strong) UIView *v1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation HorizontalView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setWithInitailValue];
    }
    return self;
}

- (void)setWithInitailValue
{
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = 1;
    
    // bkg view
    UIImageView *imv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_1"]];
    imv.frame = self.bounds;
    [self addSubview:imv];
    
    
    // view
    _v1 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 200)];
    _v1.backgroundColor = [[Helper share] getRandomColorWithAlpha:0.4];
    [self addSubview:_v1];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1:)];
    [_v1 addGestureRecognizer:tap1];
}

- (void)tapGesture1:(UITapGestureRecognizer *)tapGesture
{
    CGPoint pp = [tapGesture locationInView:_v1];
    NSLog(@"pp = %f, %f", pp.x, pp.y);
}

@end

//
//  AnimationRotateVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/7.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "AnimationRotateVCTL.h"
#import "AnimationRotateView.h"
#import "HorizontalView2.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
#define DURATION 0.7f
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface AnimationRotateVCTL ()

@property (nonatomic, strong) AnimationRotateView *av1;
@property (nonatomic, strong) AnimationRotateView *av2;

@property (nonatomic, strong) HorizontalView2 *v3;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AnimationRotateVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self fun1];
    [self fun2];
    
}

- (void)fun1
{
    _av1 = [[AnimationRotateView alloc] init];
    _av1.frame = CGRectMake(100, 100, 100, 50);
    _av1.backgroundColor = [UIColor redColor];
    [self.view addSubview:_av1];
    _av1.hidden = NO;
    
    _av2 = [[AnimationRotateView alloc] init];
    _av2.frame = CGRectMake(100, 100, 100, 50);
    _av2.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:_av2];
//    _av2.hidden = YES;
}

- (void)fun2
{
    _v3 = [[HorizontalView2 alloc] initWithFrame:CGRectMake(100, 300, 100, 50)];
//    [self.view addSubview:_v3];
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        CGAffineTransform rotate = CGAffineTransformMakeRotation(90 / 180.0 * M_PI );
//        [_v3 setTransform:rotate];
//    });
}


- (IBAction)btn1:(id)sender
{
    [self an3];
}

- (IBAction)btn2:(id)sender
{
    [self an4];
}

- (IBAction)btn3:(id)sender
{
    [_v3 publicFun1];
}

- (IBAction)btn4:(id)sender
{
    [_v3 publicFun2];
}

- (void)an1
{
    [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
    [self.view addSubview:_av2];
}

- (void)an2
{
    [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
    [_av2 removeFromSuperview];
}

- (void)an3
{
    [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
    [self.view addSubview:_v3];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        CGAffineTransform rotate = CGAffineTransformMakeRotation(90 / 180.0 * M_PI );
        [_v3 setTransform:rotate];
    });
}

- (void)an4
{
    [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
    [_v3 removeFromSuperview];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        CGAffineTransform rotate = CGAffineTransformMakeRotation(0);
        [_v3 setTransform:rotate];
    });
}

#pragma UIView实现动画
- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition
{
    [UIView animateWithDuration:DURATION animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}


@end

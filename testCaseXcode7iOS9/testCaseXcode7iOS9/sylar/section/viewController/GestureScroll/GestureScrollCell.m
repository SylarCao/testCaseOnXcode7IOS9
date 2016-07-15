//
//  GestureScrollCell.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/7/15.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "GestureScrollCell.h"
#import "Helper.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface GestureScrollCell()
<UIGestureRecognizerDelegate>


@property (nonatomic, weak) IBOutlet UIView *bkgView;

@property (nonatomic, strong) UIPanGestureRecognizer *pan;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation GestureScrollCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _bkgView.backgroundColor = [[Helper share] getColor:[UIColor redColor] alpha:0.5];
    
    // tap
    UITapGestureRecognizer *tap_gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTapAction:)];
    [_bkgView addGestureRecognizer:tap_gesture];
    
    // pan
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(getsurePanAction:)];
    [_bkgView addGestureRecognizer:pan];
    _pan = pan;
    pan.delegate = self;
    
}






- (void)gestureTapAction:(UITapGestureRecognizer *)aGesture
{
    NSLog(@"tap");
}

- (void)getsurePanAction:(UIPanGestureRecognizer *)aGesture
{
    CGPoint pp = [aGesture translationInView:_bkgView];
    NSLog(@"pan = %f, %f", pp.x, pp.y);
    
}

- (BOOL)checkVerticle:(UIPanGestureRecognizer *)panGesture
{
    BOOL rt = YES;
    CGPoint pp = [panGesture translationInView:_bkgView];
    if (pp.x != 0 )
    {
        CGFloat y_x = pp.y/pp.x;
        if (y_x < 3)
        {
            rt = NO;
        }

    }
    
    return rt;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    // 这个 是 2个手势都触发，传递给下边
//    if (_pan == gestureRecognizer)
//    {
//        NSLog(@"\nshould yes - %@", NSStringFromClass([otherGestureRecognizer class]));
//    }
//    else
//    {
//        NSLog(@"should no");
//    }
    
//    BOOL rt = YES;
//    if ([self checkVerticle:(UIPanGestureRecognizer *)gestureRecognizer])
//    {
//        rt = NO;
//    }
    
    return NO;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    BOOL rt = YES;
    UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
    if ([self checkVerticle:pan])
    {
        rt = NO;
    }
    
    return rt;
}






@end

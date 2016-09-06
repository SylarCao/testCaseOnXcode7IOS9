//
//  HorizontalVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/28.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "HorizontalVCTL.h"
#import "HorizontalView.h"
#import "HorizontalView2.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface HorizontalVCTL ()

@property (nonatomic, strong) HorizontalView2 *v2;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation HorizontalVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self addView1];
//    [self addView2];
}

- (IBAction)btn1:(id)sender
{
//    [_v2 setNeedsLayout];
//    [_v2 setNeedsUpdateConstraints];
//    CGAffineTransform rotate = CGAffineTransformMakeRotation(90 / 180.0 * M_PI );
//    [_v2 setTransform:rotate];
    
    [self changePostion];
}

- (void)changePostion
{
    _v2.hidden = !_v2.hidden;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        CGAffineTransform rotate = CGAffineTransformMakeRotation(90 / 180.0 * M_PI );
//        [_v2 setTransform:rotate];
//        
//        [_v2 updateConstraints];
//        [_v2 setNeedsLayout];
//    });
}

- (IBAction)btn2:(id)sender
{
    [_v2 publicFun1];
}

- (IBAction)btn3:(id)sender
{
    [_v2 publicFun2];
}

- (void)addView1
{
    CGRect frame = self.view.bounds;
    HorizontalView *v1 = [[HorizontalView alloc] initWithFrame:CGRectMake(0, 0, frame.size.height, frame.size.width)];
    v1.center = CGPointMake(frame.size.width/2, frame.size.height/2);
    [self.view addSubview:v1];
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation(90 / 180.0 * M_PI );
    [v1 setTransform:rotate];
}

- (void)addView2
{
    _v2 = [[HorizontalView2 alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    _v2.layer.anchorPoint = CGPointMake(0.5, 0.5);
    [self.view addSubview:_v2];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        CGAffineTransform rotate = CGAffineTransformMakeRotation(90 / 180.0 * M_PI );
        [_v2 setTransform:rotate];
        
    });
    
    
}


@end

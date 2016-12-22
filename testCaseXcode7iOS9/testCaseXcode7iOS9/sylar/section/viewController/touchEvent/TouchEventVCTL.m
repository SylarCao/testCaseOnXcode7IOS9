//
//  TouchEventVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/1/4.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TouchEventVCTL.h"
#import "TouchEventView.h"
#import "TouchLabelView.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TouchEventVCTL ()
<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *v1;
@property (nonatomic, strong) TouchEventView *tv1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TouchEventVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setInitialValue];
}

- (void)setInitialValue
{
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 400, 400)];
    v1.backgroundColor = [UIColor redColor];
    [self.view addSubview:v1];
    _v1 = v1;
    
//    TouchEventView *tv1 = [[TouchEventView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//    tv1.backgroundColor = [UIColor blueColor];
//    [v1 addSubview:tv1];
//    _tv1 = tv1;
    
    TouchLabelView *tb = [[TouchLabelView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    tb.backgroundColor = [UIColor yellowColor];
    [v1 addSubview:tb];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    [v1 addGestureRecognizer:tap1];
    tap1.delegate = self;
}


- (void)tapGesture1
{
    NSLog(@"tap1");
}


#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    CGPoint location = [touch locationInView:_v1];
    NSLog(@"location = %f, %f", location.x, location.y);
    
    BOOL rt = YES;
    if (CGRectContainsPoint(_tv1.frame, location))
    {
        rt = NO;
    }
    return rt;
}

@end

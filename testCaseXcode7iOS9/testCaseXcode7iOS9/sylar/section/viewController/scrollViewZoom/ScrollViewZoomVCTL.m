//
//  ScrollViewZoomVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/2/26.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ScrollViewZoomVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ScrollViewZoomVCTL ()
<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView1;
@property (nonatomic, strong) UIScrollView *scrollView2;


@property (nonatomic, strong) UIImageView *viewZoom1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ScrollViewZoomVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self setWithScrollview1];
    [self setWithScrollView2];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)setWithScrollView2
{
//    _scrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)]
}

- (void)setWithScrollview1
{
    _viewZoom1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 1800)];
    _viewZoom1.image = [UIImage imageNamed:@"sgs6"];
    
    _scrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 70, 300, 300)];
    _scrollView1.contentSize = CGSizeMake(300, 1800);
    _scrollView1.layer.borderColor = [UIColor redColor].CGColor;
    _scrollView1.layer.borderWidth = 1;
    
    _scrollView1.decelerationRate = UIScrollViewDecelerationRateFast;
    NSLog(@"fn = %f - %f", UIScrollViewDecelerationRateFast, UIScrollViewDecelerationRateNormal);
    
    _scrollView1.minimumZoomScale = 0.5;
    _scrollView1.maximumZoomScale = 2;
    [_scrollView1 addSubview:_viewZoom1];
    
    
    [self.view addSubview:_scrollView1];
    _scrollView1.delegate = self;
    
    // add pinch gesture
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture:)];
    [_scrollView1 addGestureRecognizer:pinch];
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scroll.offset = (%.2f, %.2f)", scrollView.contentOffset.x, scrollView.contentOffset.y);
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    return NO;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"did zoom = %f", scrollView.zoomScale);
}

//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
//{
//    return _viewZoom1;
//    
//}

#pragma mark - pinch gesture
- (void)pinchGesture:(UIPinchGestureRecognizer *)gesture
{
    NSLog(@"pinch = %f - (%ld) - （%f）", gesture.scale, gesture.numberOfTouches, gesture.velocity);
}


@end

//
//  FingerTapVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/2/15.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "FingerTapVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface FingerTapVCTL ()

@property (nonatomic, weak) IBOutlet UIView *viewFinger;

@property (nonatomic, weak) IBOutlet UIView *viewPoint;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation FingerTapVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    _viewFinger.multipleTouchEnabled = YES;
    
    [self addGesture];
    
    [self addMask];
}

- (void)addGesture
{
//    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] init];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [_viewFinger addGestureRecognizer:pan];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture)];
    swipe.direction = UISwipeGestureRecognizerDirectionUp|UISwipeGestureRecognizerDirectionDown|UISwipeGestureRecognizerDirectionLeft;
    [_viewFinger addGestureRecognizer:swipe];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture:)];
    [_viewFinger addGestureRecognizer:pinch];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [_viewFinger addGestureRecognizer:tap];
}

- (void)addMask
{
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 400)];
    v1.backgroundColor = [UIColor yellowColor];
//    v1.userInteractionEnabled = NO;
//    [_viewFinger addSubview:v1];
}


#pragma mark - gesture
- (void)panGesture:(UIPanGestureRecognizer *)gesture
{
    NSLog(@"pan = %ld", gesture.state);
}

- (void)pinchGesture:(UIPinchGestureRecognizer *)gesture
{
    NSLog(@"pinch = %f - (%ld) - （%f）", gesture.scale, gesture.numberOfTouches, gesture.velocity);
    _viewPoint.center = [gesture locationInView:_viewFinger];
}

- (void)swipeGesture
{
    NSLog(@"swipe");
}

- (void)tapGesture:(UITapGestureRecognizer *)gesture
{
    NSLog(@"tap");
}

//#pragma mark - touch event
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"---------------------------");
//    for (UITouch *each_touch in touches)
//    {
//        CGPoint location = [each_touch locationInView:_viewFinger];
//        NSLog(@"location = %.2f, %.2f", location.x, location.y);
//    }
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"-------------%ld--------------", event.allTouches.count);
//    
//    for (UITouch *each_touch in touches)
//    {
//        CGPoint location = [each_touch locationInView:_viewFinger];
//        NSLog(@"move = %.2f, %.2f", location.x, location.y);
//    }
//    if ( event.allTouches.count == 2)
//    {
//        CGPoint l1 = CGPointZero;
//        CGPoint l2 = CGPointZero;
//        BOOL first_object = YES;
//        for (UITouch *each_touch in event.allTouches)
//        {
//            if (first_object)
//            {
//                l1 = [each_touch locationInView:_viewFinger];
//                first_object = NO;
//            }
//            else
//            {
//                l2 = [each_touch locationInView:_viewFinger];
//            }
//        }
//        
//        CGPoint new_point = CGPointMake(l1.x/2+l2.x/2, l1.y/2+l2.y/2);
//        _viewPoint.center = new_point;
//        
//    }
//}



@end
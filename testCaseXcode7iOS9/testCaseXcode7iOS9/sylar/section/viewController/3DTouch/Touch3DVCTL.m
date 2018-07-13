//
//  Touch3DVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/9.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "Touch3DVCTL.h"
//#import <AudioToolbox/AudioToolbox.h>
#import "AudioToolbox/AudioToolbox.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface Touch3DVCTL ()
{
    CGPoint touchPoint;
    UIImageView *canDraw;
}
@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation Touch3DVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    canDraw = [[UIImageView alloc] initWithFrame:self.view.bounds];
    canDraw.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:canDraw];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    touchPoint = [touch locationInView:canDraw];
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"move");
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:canDraw];
    
    UIGraphicsBeginImageContext(canDraw.frame.size);
    [canDraw.image drawInRect:CGRectMake(0.0, 0.0, canDraw.frame.size.width, canDraw.frame.size.height)];
    
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    
    float lineWidthc = 10.0;
    if ([touch respondsToSelector:@selector(force)]) {
        NSLog(@"force:%f (%f, %f)", touch.force, [touch locationInView:canDraw].x, [touch locationInView:canDraw].y);
        lineWidthc = lineWidthc * touch.force;
    }
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), lineWidthc);
    
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), touchPoint.x, touchPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    canDraw.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    touchPoint = currentPoint;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

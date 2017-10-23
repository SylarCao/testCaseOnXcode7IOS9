//
//  MyScrollView.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/10/10.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "MyScrollView.h"
#import "ColorView.h"

@interface MyScrollView () <UIGestureRecognizerDelegate>

@end

@implementation MyScrollView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.panGestureRecognizer.delegate = self;  //  这个delegate必须是scrollview
        self.delaysContentTouches = NO;
    }
    return self;
}


- (BOOL)touchesShouldBegin:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event inContentView:(UIView *)view {
    NSLog(@"sylar :  aa");
    
    if ([view isKindOfClass:[ColorView class]]) {
        return NO;
    }
    
    return YES;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    BOOL rt = YES;
    if (self.panGestureRecognizer == gestureRecognizer) {
        NSLog(@"sylar :  aa");
        CGPoint location = [gestureRecognizer locationInView:self];
        if (location.x > kScreenWidth/2) {
            rt = NO;
        }
    }
    return rt;
}


@end

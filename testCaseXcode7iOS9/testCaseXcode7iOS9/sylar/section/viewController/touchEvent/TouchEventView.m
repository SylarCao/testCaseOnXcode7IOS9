//
//  TouchEventView.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/1/4.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import "TouchEventView.h"

@implementation TouchEventView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tt = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(aaa)];
        [self addGestureRecognizer:tt];
    }
    return self;
}

- (void)aaa {
    NSLog(@"sylar :  aaa");
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"begin");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"end");
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"cancel");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"move");
}

//- (BOOL)canBecomeFirstResponder
//{
//    return YES;
//}



@end

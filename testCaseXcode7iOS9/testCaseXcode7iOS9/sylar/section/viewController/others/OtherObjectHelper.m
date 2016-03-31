//
//  OtherObjectHelper.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/31.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "OtherObjectHelper.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface OtherObjectHelper()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation OtherObjectHelper

- (id)init
{
    self = [super init];
    if (self)
    {
        [self setInitialValue];
    }
    return self;
}

- (void)setInitialValue
{
    [self addObserver:self forKeyPath:@"self.aViewcontroller" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"");
}

- (void)setAViewcontroller:(UIViewController *)aViewcontroller
{
    NSLog(@"");
    _aViewcontroller = aViewcontroller;
}

@end

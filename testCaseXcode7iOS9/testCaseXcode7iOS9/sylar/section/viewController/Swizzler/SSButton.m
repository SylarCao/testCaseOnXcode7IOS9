//
//  SSButton.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/11/8.
//  Copyright © 2018 sylar. All rights reserved.
//

#import "SSButton.h"

@implementation SSButton

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(50, 180, 66, 66);
        [self setTitle:@"ssbutton" forState:UIControlStateNormal];
        [self addTarget:self action:@selector(tapSSButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)didMoveToWindow {
    [super didMoveToWindow];
    NSLog(@"sylar : did move to window");
}

- (void)tapSSButton {
    NSLog(@"sylar : tapppp ss button");
}

- (void)sfun1 {
    NSLog(@"sylar : sfun1");
}

@end

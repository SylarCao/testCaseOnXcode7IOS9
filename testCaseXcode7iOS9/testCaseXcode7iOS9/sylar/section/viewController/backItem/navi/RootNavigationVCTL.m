//
//  RootNavigationVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/7/23.
//  Copyright © 2018年 sylar. All rights reserved.
//

#import "RootNavigationVCTL.h"

@interface RootNavigationVCTL () <UIGestureRecognizerDelegate>

@end

@implementation RootNavigationVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
    }
}

@end

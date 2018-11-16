//
//  Push3CodeVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/11/16.
//  Copyright © 2018 sylar. All rights reserved.
//

#import "Push3CodeVCTL.h"

@interface Push3CodeVCTL ()

@end

@implementation Push3CodeVCTL

- (void)dealloc {
    NSLog(@"sylar : dealloc Push3CodeVCTL");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.2];
    
    self.title = NSStringFromClass([self class]);
    
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeCustom];
    b1.frame = CGRectMake(50, 100, 50, 50);
    [b1 setTitle:@"b2" forState:UIControlStateNormal];
    [b1 addTarget:self action:@selector(fun1) forControlEvents:UIControlEventTouchUpInside];
    [b1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:b1];
    
    b1.layer.borderColor = [UIColor redColor].CGColor;
    b1.layer.borderWidth = 1;
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    v2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:v2];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    [v2 addGestureRecognizer:tap];
}

- (void)fun1 {
    NSLog(@"sylar : f1");
    
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (void)tapGesture1 {
    NSLog(@"sylar : tap 1");
}

@end

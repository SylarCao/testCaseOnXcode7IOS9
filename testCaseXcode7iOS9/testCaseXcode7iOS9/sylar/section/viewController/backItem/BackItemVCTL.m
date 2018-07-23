//
//  BackItemVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/7/23.
//  Copyright © 2018年 sylar. All rights reserved.
//

#import "BackItemVCTL.h"

@interface BackItemVCTL () <UIGestureRecognizerDelegate>

@end

@implementation BackItemVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setBack1];
    
    [self fun1];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)fun1 {
    // 这个方法可以 右滑返回， 也可以用 RootNavigationVCTL 
    id aaa = self.navigationController.interactivePopGestureRecognizer.delegate;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    NSLog(@"sylar : aaaa = %@", aaa);
}

- (void)setBack1 {
    UIImage *img = [UIImage imageNamed:@"img_back"];
    img = [[UIImage imageNamed:@"img_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target:self action:@selector(actionBack)];
    [self.navigationItem setLeftBarButtonItem:back];
}

- (void)actionBack {
    NSLog(@"sylar : tap back    ");
    [self.navigationController popViewControllerAnimated:YES];
}

@end

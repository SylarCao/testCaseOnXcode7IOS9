//
//  Push2CodeVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/11/16.
//  Copyright © 2018 sylar. All rights reserved.
//

#import "Push2CodeVCTL.h"

@interface Push2CodeVCTL ()

@end

@implementation Push2CodeVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.title = NSStringFromClass([self class]);
    
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeCustom];
    b1.frame = CGRectMake(100, 100, 50, 50);
    [b1 setTitle:@"b1" forState:UIControlStateNormal];
    [b1 addTarget:self action:@selector(fun1) forControlEvents:UIControlEventTouchUpInside];
    [b1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:b1];
}


- (void)fun1 {
    NSLog(@"sylar : f1");
}




@end

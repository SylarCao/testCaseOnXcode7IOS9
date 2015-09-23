//
//  BasicVCTL.m
//  testCase
//
//  Created by sylar on 15/9/21.
//  Copyright (c) 2015年 sylar. All rights reserved.
//

#import "BasicVCTL.h"

@interface BasicVCTL ()

@end

@implementation BasicVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.title = NSStringFromClass([self class]);
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:nil action:nil];
}

@end

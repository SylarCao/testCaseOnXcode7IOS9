//
//  BackItemVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/7/23.
//  Copyright © 2018年 sylar. All rights reserved.
//

#import "BackItemVCTL.h"

@interface BackItemVCTL ()

@end

@implementation BackItemVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setBack1];
}

- (void)setBack1 {
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
//    backButton.accessibilityLabel = @"返回";
//    if (backButton){
//        [self.navigationItem setLeftBarButtonItem:backButton];
//    }
    UIImage *img = [UIImage imageNamed:@"img_back"];
    img = [[UIImage imageNamed:@"img_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target:self action:@selector(actionBack)];
    [self.navigationItem setLeftBarButtonItem:back];
}

- (void)actionBack {
    NSLog(@"sylar : tap back    ");
}

@end

//
//  UIButtonBVTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/2/14.
//  Copyright © 2017年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "UIButtonBVTL.h"
#import "Masonry.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface UIButtonBVTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIButtonBVTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fun1];
    
}

- (void)fun1 {
    
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeCustom];
    b1.translatesAutoresizingMaskIntoConstraints = NO;
    
    [b1 setImage:[UIImage imageNamed:@"sgs5TH"] forState:UIControlStateNormal];
    [b1 setImage:[UIImage imageNamed:@"sgs5TH"] forState:UIControlStateHighlighted];
    
//    [b1 setBackgroundImage:[UIImage imageNamed:@"sgs7"] forState:UIControlStateNormal];
    
    [self.view addSubview:b1];
    
    b1.layer.borderColor = [UIColor redColor].CGColor;
    b1.layer.borderWidth = 1;
    
    UIImage *img = [UIImage imageNamed:@"sgs5TH"];
    [b1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset = img.size.width;
        make.height.offset = img.size.height;
        make.centerX.offset = 0;
        make.top.offset = 100;
    }];
    
}




@end

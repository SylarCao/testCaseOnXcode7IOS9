//
//  ViewCategory1.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/22.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface  UIView (ViewCategory1)

@property (nonatomic, strong) UIView *v1;
@property (nonatomic, strong) NSString *s1;  // 需要写get set方法，否则会crash

- (void)showRedView;


- (void)hideRedView;

@end

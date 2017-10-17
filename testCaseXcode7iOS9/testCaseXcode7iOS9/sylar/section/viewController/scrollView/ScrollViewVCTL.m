//
//  ScrollViewVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/10/10.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "ScrollViewVCTL.h"
#import "MyScrollView.h"
#import "ColorView.h"
#import "Masonry.h"

@interface ScrollViewVCTL ()

@end

@implementation ScrollViewVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self fun1];
    
    [self fun2];
}

- (void)fun2 {
    // scroll view 
    CGFloat width = self.view.frame.size.width;
    NSLog(@"sylar :  %f, %f", self.view.frame.size.width, self.view.frame.size.height);
    width = kScreenWidth;
    
    MyScrollView *v1 = [[MyScrollView alloc] initWithFrame:CGRectZero];
    v1.contentSize = CGSizeMake(width, 1000);
    [self.view addSubview:v1];
    
    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset = 0;
        make.bottom.offset = 0;
        make.left.offset = 0;
        make.right.offset = 0;
    }];
    
    ColorView *c1 = [[ColorView alloc] initWithFrame:CGRectMake(0, 0, width, 1000)];
    [c1 setRangeColor:[UIColor redColor] anotherColor:[UIColor whiteColor]];
    [v1 addSubview:c1];
    
}

- (void)fun1 {
    //  画一个有颜色的view
//    ColorView *v1 = [[ColorView alloc] initWithFrame:CGRectMake(50, 100, 200, 400)];
//    [v1 setRangeColor:[UIColor blueColor] anotherColor:[UIColor clearColor]];
//    [self.view addSubview:v1];
}

@end

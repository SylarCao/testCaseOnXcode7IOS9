//
//  DrawView1.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/10.
//  Copyright © 2015年 sylar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView1 : UIView

// 画直线
@property (nonatomic, assign) NSInteger lineYStart;
@property (nonatomic, assign) NSInteger lineYEnd;
@property (nonatomic, assign) NSInteger lineX;

// 画image
@property (nonatomic, assign) CGRect imageRect;


- (void)publicFun1;

- (void)publicFun2:(CGRect)rect;

@end


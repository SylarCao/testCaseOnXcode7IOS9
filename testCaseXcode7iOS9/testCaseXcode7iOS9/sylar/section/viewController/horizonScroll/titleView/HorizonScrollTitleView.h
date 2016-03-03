//
//  HorizonScrollTitleView.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/3.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizonScrollTitleView : UIView

@property (nonatomic, assign) CGSize size;

- (id)initWithNib;

- (void)setWithCount:(NSInteger)count;

- (void)setScrollToPos:(CGFloat)posX;


@end

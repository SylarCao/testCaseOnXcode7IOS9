//
//  LoadingView.h
//  iPhoneNewVersion
//
//  Created by Howard on 13-7-10.
//  Copyright (c) 2013年 DZH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GJBaseView.h"

#define kPROffsetY 60.f
#define kPRAnimationDuration .18f

typedef enum {
    kPRStateNormal      = 0,  // 正常，什么都没发生
    kPRStatePulling     = 1,  // 释放的时候就会 刷新了
    kPRStateLoading     = 2,  // 正在刷新
    kPRStateHitTheEnd   = 3,
} PRState;

@interface LoadingView : GJBaseView{
    CGFloat _openOffsetY;
}

@property (nonatomic, retain) UILabel *stateLabel;
@property (nonatomic, retain) UILabel *dateLabel;
@property (nonatomic, retain) UIImageView *arrowView;
@property (nonatomic, retain) UIActivityIndicatorView *activityView;
@property (nonatomic, getter = isLoading) BOOL loading;
@property (nonatomic, getter = isAtTop) BOOL atTop;
@property (nonatomic) PRState state;    // 当前是否在刷新的state
@property (nonatomic, retain) UIImage *arrowImage;
@property (nonatomic, retain) UIImage *arrowImageDown;
@property (nonatomic, assign)  CGFloat openOffsetY;
- (id)initWithFrame:(CGRect)frame atTop:(BOOL)top;

- (void)updateRefreshDate:(NSDate *)date format:(NSString*)formatString;
- (void)setState:(PRState)state animated:(BOOL)animated;
- (void)updateRefreshDate:(NSDate *)date;

@end

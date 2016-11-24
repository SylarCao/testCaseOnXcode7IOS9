//
//  AppDelegate+MaskView.m
//  CustomTabViewController
//
//  Created by Yorke on 16/2/12.
//  Copyright © 2016年 WuTong. All rights reserved.
//

#import "AppDelegate+MaskView.h"
#import "UIImage+ImageEffects.h"
#import "UIImage+ScreenShot.h"
#import <objc/runtime.h>

static NSString *CustomMaskViewKey = @"CustomMaskViewKey";

@implementation AppDelegate (MaskView)

- (void)showMaskView{
    id maskView = objc_getAssociatedObject(self, (__bridge const void *)(CustomMaskViewKey));
    if(maskView == nil){
        maskView = [[UIImageView alloc]initWithFrame:self.window.bounds];
        [(UIImageView *)maskView setAlpha:0.0f];
        objc_setAssociatedObject(self, (__bridge const void *)(CustomMaskViewKey), maskView, OBJC_ASSOCIATION_RETAIN);
    }
    UIImage *screenShot = [UIImage beginImageContext:self.window.bounds View:self.window];
    [(UIImageView *)maskView setImage:[screenShot blurImage]];
    // 再次设置，防止旋转造成位置变化
    [(UIImageView *)maskView setFrame:self.window.bounds];
    [self.window addSubview:maskView];
    [UIView animateWithDuration:.5f animations:^{
        [(UIImageView *)maskView setAlpha:1.0f];
    }];
    
}

- (void)dismissMaskView{
    id maskView = objc_getAssociatedObject(self, (__bridge const void *)(CustomMaskViewKey));
    if(maskView == nil) return;
    [UIView animateWithDuration:.5f animations:^{
        [(UIImageView *)maskView setAlpha:0.0f];
    } completion:^(BOOL finished) {
        [(UIImageView *)maskView removeFromSuperview];
    }];
}

@end

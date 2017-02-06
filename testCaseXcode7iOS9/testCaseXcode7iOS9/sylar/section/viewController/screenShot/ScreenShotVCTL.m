//
//  ScreenShotVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/2/6.
//  Copyright © 2017年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ScreenShotVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ScreenShotVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ScreenShotVCTL

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"sylar :  abc");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidTakeScreenshot:) name:UIApplicationUserDidTakeScreenshotNotification object:nil];
    
    
}

- (void)userDidTakeScreenshot:(NSNotification *)notification {
    NSLog(@"sylar :  screen shot ....");
}

@end

//
//  ScreenShotVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/2/6.
//  Copyright © 2017年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ScreenShotVCTL.h"
#import <QuartzCore/QuartzCore.h>

//extern "C" CGImageRef UIGetScreenImage();

////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ScreenShotVCTL ()

@property (nonatomic, weak) IBOutlet UIImageView *imv1;

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


- (IBAction)btn1:(id)sender {
//    [self fun1];
    
//    [self fun2];
    
    [self fun3];
}

- (void)fun1 {
    UIView * view = [[UIScreen mainScreen] snapshotViewAfterScreenUpdates:NO];
    UIGraphicsBeginImageContext(view.frame.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _imv1.image = image;
}

- (void)fun2 {
    UIView *v1 = [[UIApplication sharedApplication].windows firstObject];
    UIGraphicsBeginImageContext(v1.frame.size);
    [v1.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    NSLog(@"sylar :  image = %@", image);
    
    _imv1.image = image;
}

- (void)fun3 {
//    CGImageRef s1 = NSSelectorFromString(@"UIGetScreenImage");//UIGetScreenImage();
    
//    if ([s1 des])
    
//    [s1 ki]
    
//    UIImage *image1 = [UIImage imageWithCGImage:screenshot];
//    _imv1.image = image1;
}


@end

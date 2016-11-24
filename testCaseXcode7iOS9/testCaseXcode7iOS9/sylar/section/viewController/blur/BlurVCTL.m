//
//  BlurVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/11/24.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "BlurVCTL.h"
#import "UIImage+ScreenShot.h"
#import "UIImage+ImageEffects.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BlurVCTL ()

@property (nonatomic, weak) IBOutlet UIImageView *v1;


@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BlurVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _v1.layer.borderColor = [UIColor redColor].CGColor;
    _v1.layer.borderWidth = 1;
}

- (IBAction)btn1:(id)sender
{
    [self fun1];
}

- (void)fun2
{
    UIBlurEffect
}

- (void)fun1
{
    NSTimeInterval t1 = [NSDate timeIntervalSinceReferenceDate];
    UIImage *im1 = [UIImage beginImageContext:CGRectMake(130, 150, 120, 50) View:self.view];
    
    UIImage *im2 = [im1 applyBlurWithRadius:5 tintColor:nil saturationDeltaFactor:0 maskImage:nil];
    
    NSTimeInterval t2 = [NSDate timeIntervalSinceReferenceDate];
    
    NSLog(@"sylar :  time = %f", t2 - t1);
    NSLog(@"sylar :  time = %f", t2 - t1);
}


@end

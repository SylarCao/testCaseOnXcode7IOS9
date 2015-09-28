//
//  LewPopupVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/9/28.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "LewPopupVCTL.h"
#import "LewPopupViewController.h"
#import "LewView1.h"
#import "LewView2.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface LewPopupVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation LewPopupVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)btn1:(id)sender
{
    [self popupView1];
}

- (IBAction)btn2:(id)sender
{
    [self popupView2];
}

- (void) popupView1
{
    LewView1 *v1= [[LewView1 alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    LewPopupViewAnimationSlide *animation = [[LewPopupViewAnimationSlide alloc]init];
    animation.type = LewPopupViewAnimationSlideTypeTopBottom;
    
    [self lew_presentPopupView:v1 animation:animation];
    
    
}

- (void) popupView2
{
    UINib *nib = [UINib nibWithNibName:@"LewView2" bundle:nil];
    UIView *v2 = [[nib instantiateWithOwner:nil options:nil] lastObject];
    v2.frame = CGRectMake(0, 0, 150, 150);
    
    LewPopupViewAnimationSlide *animation = [[LewPopupViewAnimationSlide alloc]init];
    animation.type = LewPopupViewAnimationSlideTypeTopBottom;
    
    [self lew_presentPopupView:v2 animation:animation];
}


@end

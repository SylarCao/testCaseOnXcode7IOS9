//
//  MBProgressHudVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/15.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "MBProgressHudVCTL.h"
#import "MBProgressHUD.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface MBProgressHudVCTL ()

@property (nonatomic, strong) MBProgressHUD *hud;

@property (nonatomic, weak) IBOutlet UIView *v1;

@property (nonatomic, strong) UIActivityIndicatorView *v2;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation MBProgressHudVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self fun1];
}


- (IBAction)btn1:(id)sender
{
//    [self showHudAnimation];
//    [self hideHudAnimation];
    [self showHudWithTitle];
//    [_v2 stopAnimating];
    
//    [_v1 bringSubviewToFront:_v2];
//    [_v2 stopAnimating];
    
    
}

- (void)fun1
{
    UIActivityIndicatorView *in_view = [[UIActivityIndicatorView alloc] initWithFrame:_v1.bounds];
    [_v1 addSubview:in_view];
//    [in_view startAnimating];
//    _v2 = in_view;
    
    // add button
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeSystem];
    b1.frame = CGRectMake(200, 100, 50, 50);
    [b1 setTitle:@"bv1" forState:UIControlStateNormal];
    [_v1 addSubview:b1];
}

- (IBAction)btn2:(id)sender
{
    NSLog(@"tap");
}

- (void) showHudWithTitle
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    _hud = hud;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = @"hud";
    hud.margin = 20;;
    //    hud.removeFromSuperViewOnHide = YES;
    [_hud show:YES];
    //    [hud hide:YES afterDelay:1];
    
    hud.labelText = @"aaa";
    [_hud hide:YES afterDelay:1];
}

- (void) showHudAnimation
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud = hud;
    [hud show:YES];
}

- (void) hideHudAnimation
{
    [_hud hide:YES];
}



@end

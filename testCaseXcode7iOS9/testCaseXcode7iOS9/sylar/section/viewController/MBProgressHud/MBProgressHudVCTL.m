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

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation MBProgressHudVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)btn1:(id)sender
{
    [self showHudAnimation];
    [self hideHudAnimation];
    [self showHudWithTitle];
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

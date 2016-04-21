//
//  CameraVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/21.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "CameraVCTL.h"
#import "DefaultCameraVCTL.h"
#import "EWMCodeVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface CameraVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation CameraVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender
{
    DefaultCameraVCTL *cc = [[DefaultCameraVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:cc animated:YES];
}

- (IBAction)btn2:(id)sender
{
    EWMCodeVCTL *ee = [[EWMCodeVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:ee animated:YES];
}

@end

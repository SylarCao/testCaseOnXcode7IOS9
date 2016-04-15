//
//  PickerViewController.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/15.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "PickerViewController.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface PickerViewController ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.3];
}


- (IBAction)btn1:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end

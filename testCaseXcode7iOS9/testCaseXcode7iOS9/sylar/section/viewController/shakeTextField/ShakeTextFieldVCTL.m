//
//  ShakeTextFieldVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/9/29.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ShakeTextFieldVCTL.h"
#import "UITextField+Shake.h" //https://github.com/andreamazz/UITextField-Shake
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ShakeTextFieldVCTL ()

@property (nonatomic, weak) IBOutlet UITextField *textField1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ShakeTextFieldVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)btn1:(id)sender
{
    [_textField1 shake];
}


@end

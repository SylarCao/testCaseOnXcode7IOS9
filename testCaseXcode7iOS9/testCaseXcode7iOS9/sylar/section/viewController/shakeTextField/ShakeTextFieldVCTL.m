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
    
    [self fun1];
}

- (void)fun1
{
    UITextField *t1 = [[UITextField alloc] init];
    t1.frame = CGRectMake(100, 200, 100, 40);
    [self.view addSubview:t1];
    t1.borderStyle = UITextBorderStyleRoundedRect;
    t1.layer.borderColor = [UIColor redColor].CGColor;
    t1.layer.borderWidth = 1;
}



- (IBAction)btn1:(id)sender
{
    [_textField1 shake];
}


@end

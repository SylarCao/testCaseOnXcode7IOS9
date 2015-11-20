//
//  JSPatchVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/19.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "JSPatchVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface JSPatchVCTL ()

@property (nonatomic, weak) IBOutlet UILabel *lb1;
@property (nonatomic, weak) IBOutlet UILabel *lb2;

@property (nonatomic, strong) NSString *s1;
@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation JSPatchVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    _s1 = @"s1";
}

- (IBAction)btn1:(id)sender
{
    [self fun2];
}

- (IBAction)btn2:(id)sender
{
//    [self fun4];
    [self fun1];
}

- (void) fun1
{
    _lb1.text = @"this is fun1";
}

- (void) fun2
{
    _lb1.text = _s1;
}

- (void) fun3
{
    
}

- (void)fun4
{
    _s1 = @"s1 after fun4";
}


@end

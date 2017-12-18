//
//  PastBoardVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/12/18.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "PastBoardVCTL.h"

@interface PastBoardVCTL ()

@end

@implementation PastBoardVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender {
    UIPasteboard *pp = [UIPasteboard generalPasteboard];
    pp.string = @"abcdefg";
}

@end

//
//  BuglyVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/13.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "BuglyVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BuglyVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BuglyVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [self performSelector:@selector(crash) withObject:nil afterDelay:3.0];
#pragma clang diagnostic pop
}


- (IBAction)btn1:(id)sender
{
    
}

@end

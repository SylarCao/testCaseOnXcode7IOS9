//
//  ReleaseModeVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/19.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ReleaseModeVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ReleaseModeVCTL ()

@property (nonatomic, weak) IBOutlet UILabel *lbReleaseDebug;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ReleaseModeVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self checkReleaseMode];
    
    [self checkSimulator];
}

- (void) checkReleaseMode
{
    NSString *dd = @"nothing";
#if RELEASE
    // 好像 这个没有用
    dd = @"release";
    
# endif
    NSLog(@"dd = %@", dd);
    
#if DEBUG
    dd = @"debug";
    NSLog(@"debug mode");
# endif
    
    _lbReleaseDebug.text = dd;
    
    
    NSArray *aa = nil;
    
}

- (void)checkSimulator
{
    
    if (TARGET_OS_IPHONE)
    {
        NSLog(@"TARGET_OS_IPHONE = 1");
    }
    
    if (TARGET_IPHONE_SIMULATOR)
    {
        NSLog(@"TARGET_IPHONE_SIMULATOR = 1");
    }
    
    
}




@end

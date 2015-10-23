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
}

- (void) checkReleaseMode
{
    NSString *dd = @"nothing";
#if RELEASE
    dd = @"release";
# endif
    
    
#if DEBUG
    dd = @"debug";
# endif
    
    _lbReleaseDebug.text = dd;
    
    
    NSArray *aa = nil;
    
}




@end

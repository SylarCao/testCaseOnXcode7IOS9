//
//  BuglyVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/13.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "BuglyVCTL.h"
#import <Bugly/Bugly.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BuglyVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BuglyVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // bugly
//    BuglyConfig * config = [[BuglyConfig alloc] init];
//    config.debugMode = YES;
//    config.reportLogLevel = BuglyLogLevelWarn;
//    [Bugly startWithAppId:@"900009919" developmentDevice:YES config:config];
    
    [Bugly startWithAppId:@"900009919"];
    
    
}



- (IBAction)btn1:(id)sender
{
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Warc-retain-cycles"
//#pragma clang diagnostic ignored "-Wundeclared-selector"
//    [self performSelector:@selector(crash) withObject:nil afterDelay:3.0];
//#pragma clang diagnostic pop
    
//    NSArray *aa = @[@"a", @"b"];
//    NSString *ss = [aa objectAtIndex:9];
//    NSLog(@"ss = %@", ss);
    
    [self funCrash];
}

- (void)funCrash
{
    NSArray *aa = @[@"a", @"b", @"c"];
    NSString *ss = [aa objectAtIndex:19];
    NSLog(@"ss = %@", ss);

}

@end

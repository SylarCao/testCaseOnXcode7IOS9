//
//  AFNetworkingVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/5/9.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "AFNetworkingVCTL.h"
#import "AFNetworking.h"
#import "Reachability.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface AFNetworkingVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AFNetworkingVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender
{
//    [self fun1];
    
    [self netWorkAccess];
}

- (IBAction)btn2:(id)sender
{
    
    
    
}

- (void)netWorkAccess
{
    NSTimeInterval time1 = [NSDate timeIntervalSinceReferenceDate];
    Reachability *rr = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    
    NSInteger dd = rr.currentReachabilityStatus;
    NSString *ss = rr.currentReachabilityString;
    NSString *ff = rr.currentReachabilityFlags;
    
    NSLog(@"status = %ld, %@, %@ end", dd, ss, ff);
    
    // status = 2, WiFi, -R ------- end   (wifi)
    // status = 0, No Connection, -- ------- end  (没网络)
    // status = 1, Cellular, WR -t----- end  (4g or 3g)
    
    NSTimeInterval time2 = [NSDate timeIntervalSinceReferenceDate];
    NSLog(@"delta time = %lf", time2-time1);  // 0.002602
}


- (void)fun1
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *url = @"http://test3.gtjadev.com:8007/externalInterface.do?method=getAppTgUrl&param={abc defg}";

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUnicodeStringEncoding];  // 不加这个下边的uu输出是null
#pragma clang diagnostic pop
    NSURL *uu = [NSURL URLWithString:url relativeToURL:nil];
    
    NSLog(@"uu = %@", [uu absoluteString]);
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);

    }];
}

- (void)fun2
{
    
}

@end

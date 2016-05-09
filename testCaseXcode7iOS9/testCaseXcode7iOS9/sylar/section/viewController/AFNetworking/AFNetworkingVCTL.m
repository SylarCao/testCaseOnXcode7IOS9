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
    [self fun1];
}

- (IBAction)btn2:(id)sender
{
    
}


- (void)fun1
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *url = @"http://test3.gtjadev.com:8007/externalInterface.do?method=getAppTgUrl&param={abc defg}";
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUnicodeStringEncoding];  // 不加这个下边的uu输出是null
    
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

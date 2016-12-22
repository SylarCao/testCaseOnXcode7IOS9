//
//  GoToSettingVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/12/22.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "GoToSettingVCTL.h"
#import <CoreLocation/CoreLocation.h>
#import <MobileCoreServices/MobileCoreServices.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface GoToSettingVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation GoToSettingVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 先去 camera里把相册和照相机的权限打开
}

- (IBAction)btn1:(id)sender
{
//    [self toSetting];
    
    [self fun1];
    
}

- (void)fun1 {
    CLAuthorizationStatus ss = [CLLocationManager authorizationStatus];
    
    NSLog(@"sylar :  ss= %d", ss);
    
    if (kIOSVersion(9))
    {
        NSString *url = @"prefs:root=testiOS9";  // not work
        url = @"prefs:root=LOCATION_SERVICES";   // work
        //    url = @"prefs:root=Privacy&path=LOCATION";   // work
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        
        
//        NSURL *url = [NSURL URLWithString:@"prefs:root=WIFI"];
//        
//        if ([[UIApplication sharedApplication] canOpenURL:url]) {
//            
//            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
//        }


    }
    
    
    if (kIOSVersion(10))
    {
        // 私有api  DO work
        // reference link: https://github.com/sushushu/iOS10toSystemSetting
        
        // 1, work
//        NSURL *url = [NSURL URLWithString:@"Prefs:root=WIFI"];
//    
//        Class LSApplicationWorkspace = NSClassFromString(@"LSApplicationWorkspace");
//    
//        [[LSApplicationWorkspace performSelector:@selector(defaultWorkspace)] performSelector:@selector(openSensitiveURL:withOptions:) withObject:url withObject:nil];
        
        // 2.  NOT work
//        NSString *url = @"prefs:root=testiOS9";
//        url = @"prefs:root=LOCATION_SERVICES";
//        url = @"prefs:root=Privacy&path=LOCATION";
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];

    }


    
}


- (void)toSetting {
//    NSURL *url = [NSURL URLWithString:@"prefs:root=WIFI"];
//    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
//        NSLog(@"sylar :  success = %d", success);
//    }];
}

@end

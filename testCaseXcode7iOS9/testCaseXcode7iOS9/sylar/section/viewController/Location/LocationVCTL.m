//
//  LocationVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/6/1.
//  Copyright © 2018年 sylar. All rights reserved.
//

#import "LocationVCTL.h"
#import "PrivateAPI.h"
#import "SimulateLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationVCTL () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, strong) SimulateLocation *s1;

@end

@implementation LocationVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // sandbox 模式 感觉不可能替代xcode
//    [self initLocationManager];
    
    [PrivateAPI viewAPI];
}

- (void)initLocationManager {
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
}

- (void)addObserverLocationManager {
    
}

- (IBAction)btn1:(id)sender {
    NSLog(@"sylar : 1111");
    [self fun1];
}

- (IBAction)btn2:(id)sender {
    NSLog(@"sylar : 2222");
    [_locationManager startUpdatingLocation];
}

- (void)fun1 {
    _s1 = [[SimulateLocation alloc] init];
}


#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    // 没有开设置就 跑到这里来
    NSLog(@"fail");
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *ll = [locations lastObject];
    NSLog(@"acc = %f", ll.horizontalAccuracy);
    NSLog(@"success = %f, %f", ll.coordinate.latitude, ll.coordinate.longitude);
    [manager stopUpdatingLocation];
}

@end

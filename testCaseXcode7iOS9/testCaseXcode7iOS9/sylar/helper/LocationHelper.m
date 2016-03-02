//
//  LocationHelper.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/2.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "LocationHelper.h"
#import "Helper.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface LocationHelper()
<CLLocationManagerDelegate>

@property (nonatomic, strong) cbLocation block;
@property (nonatomic, strong) CLLocationManager *locationManager;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation LocationHelper

+ (instancetype) share
{
    static LocationHelper *inst = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        inst = [[LocationHelper alloc] init];
    });
    return inst;
}

- (void) setWithLocationManager
{
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;

    

}

- (void) getLocationWithBlock:(cbLocation)block
{
    _block = block;
    if (_locationManager == nil)
    {
        [self setWithLocationManager];
    }
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
    {
        if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [_locationManager requestWhenInUseAuthorization];   // requestWhenInUseAuthorization = 4
        }
    }
    [_locationManager stopUpdatingLocation];
    [_locationManager startUpdatingLocation];
}


- (void) cbWithLocation:(CLLocation *)location
{
    if (_block)
    {
        _block(YES, location.coordinate.longitude, location.coordinate.latitude);
    }
    _block = nil;
}


#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    // 没有开设置就 跑到这里来
    NSLog(@"fail");
    if (_block)
    {
        _block(NO, 0, 0);
    }
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    CLLocation *ll = [locations lastObject];
    NSLog(@"acc = %f", ll.horizontalAccuracy);
    NSLog(@"success = %f, %f", ll.coordinate.latitude, ll.coordinate.longitude);
    [manager stopUpdatingLocation];
    [self cbWithLocation:ll];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    // test that the horizontal accuracy does not indicate an invalid measurement
    NSLog(@"aa");
}

@end

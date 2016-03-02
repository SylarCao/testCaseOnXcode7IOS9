//
//  DPLocationVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/2.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "DPLocationVCTL.h"
#import "DPHelper.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DPLocationVCTL ()
<CLLocationManagerDelegate>

@property (nonatomic, weak) IBOutlet UITextView *textView;

@property (nonatomic, weak) IBOutlet UILabel *lb1;

@property (nonatomic, strong) CLLocationManager *locationManager;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DPLocationVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setWithLocation];
}

- (IBAction)btn1:(id)sender
{
    [[LocationHelper share] getLocationWithBlock:^(BOOL success, CLLocationDegrees longitude, CLLocationDegrees latitude) {
        if (success)
        {
            [[DPHelper share] refreshDataWithLongitude:longitude latitude:latitude block:^(BOOL success, NSString *data) {
                _textView.text = data;
            }];
        }
    }];
}


- (void)setWithLocation
{
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
    {
        if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [_locationManager requestWhenInUseAuthorization];   // requestWhenInUseAuthorization = 4
        }
    }
    
    [_locationManager startUpdatingLocation];
}



- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    // 没有开设置就 跑到这里来
    NSLog(@"fail");
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    CLLocation *ll = [locations lastObject];
//    NSLog(@"acc = %f", ll.horizontalAccuracy);
//    NSLog(@"success = %f, %f", ll.coordinate.latitude, ll.coordinate.longitude);
    NSLog(@"update");
    NSLog(@"acc = %f", ll.horizontalAccuracy);
    NSLog(@"success = %f, %f", ll.coordinate.latitude, ll.coordinate.longitude);
    [manager stopUpdatingLocation];
    _lb1.text = [NSString stringWithFormat:@"location = %f, %f", ll.coordinate.latitude, ll.coordinate.longitude];
    
}



@end

//
//  DetectRotationVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/4/26.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "DetectRotationVCTL.h"
#import <CoreMotion/CoreMotion.h>

@interface DetectRotationVCTL ()

@property (nonatomic, weak) IBOutlet UILabel *label123;

@end

@implementation DetectRotationVCTL

- (void)dealloc {
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _label123.layer.borderColor = [UIColor redColor].CGColor;
    _label123.layer.borderWidth = 1;
    
    [self fun1];
}

- (void)fun2 {
    CMMotionManager *motionManager = [[CMMotionManager alloc]init];
}

- (void)fun1 {
    // 需要把手机的转动打开了才能检测的到
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver: self selector:@selector(deviceOrientationDidChange:) name: UIDeviceOrientationDidChangeNotification object: nil];

}

- (void)deviceOrientationDidChange:(NSNotification *)notification {
    //Obtain current device orientation
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    //Do my thing
    NSLog(@"sylar :  rotate to %ld", orientation);
}

@end

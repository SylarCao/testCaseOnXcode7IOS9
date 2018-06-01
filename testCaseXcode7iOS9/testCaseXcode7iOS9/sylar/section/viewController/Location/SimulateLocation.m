//
//  SimulateLocation.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/6/1.
//  Copyright © 2018年 sylar. All rights reserved.
//

#import "SimulateLocation.h"
#import <CoreLocation/CoreLocation.h>
#import "Swizzle.h"

@implementation SimulateLocation

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"sylar : SimulateLocation init");
        [self setInitialValue];
    }
    return self;
}

- (void)setInitialValue {
    [Swizzle swizzleClass:[CLLocationManager class] method:@"setDelegate:"];
}

@end

//
//  PrivateAPI.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/6/1.
//  Copyright © 2018年 sylar. All rights reserved.
//

#import "PrivateAPI.h"
#import <objc/runtime.h>
#import <CoreLocation/CoreLocation.h>

@implementation PrivateAPI

+ (void)viewAPI {
    NSString *className = NSStringFromClass([CLLocationManager class]);
    
    
    const char *cClassName = [className UTF8String];
    
    id theClass = objc_getClass(cClassName);
    
    unsigned int outCount = 0;
    
    
    Method *m =  class_copyMethodList(theClass, &outCount);

    NSLog(@"method count = %d",outCount);
    for (int i = 0; i<outCount; i++) {
        SEL a = method_getName(*(m+i));
        NSString *sn = NSStringFromSelector(a);
        NSLog(@"mm: %@",sn);
    }
    
//    objc_property_t *pp = class_copyPropertyList(theClass, &outCount);
//    NSLog(@"property count = %d",outCount);
//    for (int i = 0; i<outCount; i++) {
//        SEL a = method_getName(*(pp+i));
//        NSString *sn = NSStringFromSelector(a);
//        NSLog(@"pp: %@",sn);
//    }
}

@end

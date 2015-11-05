//
//  LocationHelper.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/2.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
typedef void (^cbLocation)(BOOL success, CLLocationDegrees longitude, CLLocationDegrees latitude);
////////////////////////////////////////////////////////////////////////////////////////////////////////
/************************************
   plist里写点，否则没法授权
 ************************************/
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface LocationHelper : NSObject

/**
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
+ (instancetype) share;


/**
 *  get location
 *
 *  @param block <#block description#>
 */
- (void) getLocationWithBlock:(cbLocation)block;



@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
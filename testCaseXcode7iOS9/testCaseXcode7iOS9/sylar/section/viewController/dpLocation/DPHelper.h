//
//  DPHelper.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/2.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LocationHelper.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
typedef void (^cbDPLocationDataBlock)(BOOL success, NSString *data);
////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 ************************************************
 *      plist里写点东西，否则http请求没法通过       *
 ************************************************
 in plist:
 <key>NSAppTransportSecurity</key>
 <dict>
 <key>NSExceptionDomains</key>
 <dict>
 <key>yourserver.com</key>
 <dict>
 <!--Include to allow subdomains-->
 <key>NSIncludesSubdomains</key>
 <true/>
 <!--Include to allow HTTP requests-->
 <key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
 <true/>
 <!--Include to specify minimum TLS version-->
 <key>NSTemporaryExceptionMinimumTLSVersion</key>
 <string>TLSv1.1</string>
 </dict>
 </dict>
 </dict>
 
 reference: http://ste.vn/2015/06/10/configuring-app-transport-security-ios-9-osx-10-11/
 */
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DPHelper : NSObject

/**
 *  instance
 *
 *  @return <#return value description#>
 */
+ (instancetype) share;

/**
 *  get data from DP
 *
 *  @param longitude <#longitude description#>
 *  @param latitude  <#latitude description#>
 *  @param block     <#block description#>
 */
- (void) refreshDataWithLongitude:(CLLocationDegrees)longitude latitude:(CLLocationDegrees)latitude block:(cbDPLocationDataBlock)block;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////


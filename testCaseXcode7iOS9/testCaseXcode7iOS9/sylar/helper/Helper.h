//
//  Helper.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/9/25.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
#define kIOSVersion(version)    ([[Helper share] checkVersion:version])
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface Helper : NSObject

+ (instancetype) share;

/**
 *  get a random color
 *
 *  @return <#return value description#>
 */
- (UIColor *) getRandomColor;

/**
 *  get image from color
 *
 *  @param color <#color description#>
 *
 *  @return <#return value description#>
 */
- (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  get version
 *
 *  @return eg @"4.0"
 */
- (NSString *) getVersion;

/**
 *  check same version
 *
 *  @param version <#version description#>
 *
 *  @return <#return value description#>
 */
- (BOOL) checkVersion:(NSInteger)version;


@end

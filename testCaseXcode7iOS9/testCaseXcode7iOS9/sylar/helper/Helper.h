//
//  Helper.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/9/25.
//  Copyright © 2015年 sylar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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

@end

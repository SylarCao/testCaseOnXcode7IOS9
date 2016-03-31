//
//  OthersInstance.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/30.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OthersInstance : NSObject

/**
 *  instance
 *
 *  @return return value description
 */
+ (instancetype)share;


/**
 *  添加一个viewcontroller
 *
 *  @param aViewController aViewController description
 */
- (void)addVCTL:(UIViewController *)aViewController;

@end

//
//  BasicVCTL.h
//  testCase
//
//  Created by sylar on 15/9/21.
//  Copyright (c) 2015年 sylar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helper.h"

#define BasicVCTLTest10 (1)  // relative to PreFixObjectTest10

@interface BasicVCTL : UIViewController

/**
 *  show hud
 *
 *  @param content content description
 */
- (void) showHudWithContent:(NSString *)content;

/**
 获取最近点击的

 @return return value description
 */
+ (NSMutableArray *)getPlistArray;


@end

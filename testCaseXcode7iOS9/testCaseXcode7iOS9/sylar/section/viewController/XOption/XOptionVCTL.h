//
//  XOptionVCTL.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/2/18.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import <UIKit/UIKit.h>
#import "BasicVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
typedef NS_OPTIONS(NSInteger, OptionTest) {
    op_test0   = 0xFF,  // -1 也可以
    op_test2   = 1 << 0,
    op_test3   = 1 << 1,
    op_test4   = 1 << 2,
    op_test5   = 1 << 3,
    op_test6   = 0b111,
};
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface XOptionVCTL : BasicVCTL



@end

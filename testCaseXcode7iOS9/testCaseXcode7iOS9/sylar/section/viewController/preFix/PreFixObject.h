//
//  PreFixObject.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/6/22.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicVCTL.h"

// prefix里的define修改了会重新编译，其他地方的不会
// relative to BasicVCTLTest10, ThreadVCTLTest10
#define PreFixObjectTest10 (0)

@interface PreFixObject : NSObject


+ (void) fun1;

+ (void)fun2;

+ (NSInteger)doubleValue:(NSInteger)value;




@end

//
//  StringArrayHelper.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/24.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import <Foundation/Foundation.h>

// 必须写在.h里写 extern，如果直接写 会报错
extern NSString *const constStringArrayHelper1;

@interface StringArrayHelper : NSObject

@property (nonatomic, strong) NSString *p1;


/**
 *  init
 *
 *  @param p1 p1 description
 *
 *  @return return value description
 */
- (id)initWithData:(NSInteger)p1;

@end

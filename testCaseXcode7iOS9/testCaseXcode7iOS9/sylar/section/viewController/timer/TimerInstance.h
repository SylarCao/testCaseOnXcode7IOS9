//
//  TimerInstance.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/24.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerInstance : NSObject


+ (instancetype)share;


- (void)startTimer:(id)delegate selector:(SEL)selector content:(NSString *)content;

/**
 *  复用
 *
 *  @param delegate delegate description
 *  @param selector selector description
 *  @param content  content description
 */
- (void)reStartTimer:(id)delegate selector:(SEL)selector content:(NSString *)content;


- (void)fun1;

@end

//
//  BlockHelperTimer.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/8.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
@protocol BlockHelperTimerDelegate <NSObject>

@optional
- (void)BlockHelperTimerCallBackAfter2Second;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BlockHelperTimer : NSObject


@property (nonatomic, weak) id<BlockHelperTimerDelegate> delegate;


/**
 *  instance
 *
 *  @return return value description
 */
+ (instancetype)share;

/**
 *  call back 2 second
 *
 *  @param delegate delegate description
 *  @param obj      不要释放的obj
 */
- (void)fun2SecondAfter:(id<BlockHelperTimerDelegate>)delegate obj:(id)obj;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
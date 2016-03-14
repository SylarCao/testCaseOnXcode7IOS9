//
//  BlockHelperTimer.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/8.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "BlockHelperTimer.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BlockHelperTimer()

@property (nonatomic, strong) id obj;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BlockHelperTimer

+ (instancetype)share
{
    static BlockHelperTimer *inst = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        inst = [[BlockHelperTimer alloc] init];
    });
    return inst;
}

- (void)fun2SecondAfter:(id<BlockHelperTimerDelegate>)delegate obj:(id)obj
{
    _delegate = delegate;
    _obj = obj;
    [self performSelector:@selector(second2) withObject:nil afterDelay:2];
}

- (void)second2
{
    if ([_delegate respondsToSelector:@selector(BlockHelperTimerCallBackAfter2Second)])
    {
        [_delegate performSelector:@selector(BlockHelperTimerCallBackAfter2Second)];
    }
    _obj = nil;
}


@end

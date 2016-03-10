//
//  BlockObject1.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/8.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "BlockObject1.h"
#import "BlockHelperTimer.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BlockObject1()
<BlockHelperTimerDelegate>

@property (nonatomic, strong) BlockObject1BlockStrong blockStrong;

@property (nonatomic, weak) BlockObject1BlockWeak blockWeak;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BlockObject1

- (void)dealloc
{
    NSLog(@"object dealloc");
}

- (void)requestBlockStrong:(BlockObject1BlockStrong)block
{
    _blockStrong = block;
//    [self performSelector:@selector(cbStrongBlock) withObject:nil afterDelay:2];
    [[BlockHelperTimer share] fun2SecondAfter:self obj:self];
}

- (void)requestBlockWeak:(BlockObject1BlockWeak)block
{
    _blockWeak = block;
//    [self performSelector:@selector(cbWeakBlock) withObject:nil afterDelay:2];
    [[BlockHelperTimer share] fun2SecondAfter:self obj:self];
}


- (void)cbStrongBlock
{
    if (_blockStrong)
    {
        _blockStrong(@"strong block call back");
    }
//    [self performSelector:@selector(cbStrongBlock) withObject:nil afterDelay:2];
}

- (void)cbWeakBlock
{
    if (_blockWeak)
    {
        _blockWeak(@"weak block call back");
    }
//    [self performSelector:@selector(cbWeakBlock) withObject:nil afterDelay:2];
}

- (void)BlockHelperTimerCallBackAfter2Second
{
    if (_blockStrong)
    {
        _blockStrong(@"strong block call back");
    }
    else
    {
        NSLog(@"not strong");
    }
    
    if (_blockWeak)
    {
        _blockWeak(@"weak block call back");
    }
    else
    {
        NSLog(@"not weak");
    }
}



@end

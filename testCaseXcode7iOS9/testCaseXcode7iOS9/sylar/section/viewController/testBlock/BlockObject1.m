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

@property (nonatomic, strong) BlockObject1BlockPara1 blockPara1;

@property (nonatomic, strong) NSString *para1;

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
    [[BlockHelperTimer share] fun2SecondAfter:self obj:nil];
}

- (void)requestBlockWeak:(BlockObject1BlockWeak)block
{
    _blockWeak = block;
//    [self performSelector:@selector(cbWeakBlock) withObject:nil afterDelay:2];
    [[BlockHelperTimer share] fun2SecondAfter:self obj:nil];
}

- (void)requestBlockWithParameter:(NSString *)para1 block:(BlockObject1BlockPara1)block
{
    _para1 = para1;
    _blockPara1 = block;
//    [[BlockHelperTimer share] fun2SecondAfter:self obj:self];
    [self performSelector:@selector(BlockHelperTimerCallBackAfter2Second) withObject:nil afterDelay:2];
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
//        _blockStrong = nil;  
    }
    
    if (_blockWeak)
    {
        _blockWeak(@"weak block call back");
    }
    
    if (_blockPara1)
    {
        _blockPara1(_para1);
    }
}



@end

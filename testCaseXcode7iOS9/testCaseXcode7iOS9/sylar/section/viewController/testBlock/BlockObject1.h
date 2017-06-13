//
//  BlockObject1.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/8.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
typedef void (^BlockObject1BlockStrong)(NSString *data); 

typedef void (^BlockObject1BlockWeak)(NSString *data);

typedef void (^BlockObject1BlockPara1)(NSString *data);
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BlockObject1 : NSObject


/**
 *  strong block
 *
 *  @param block block description
 */
- (void)requestBlockStrong:(BlockObject1BlockStrong)block;


/**
 *  weak 的block
 *
 *  @param block block description
 */
- (void)requestBlockWeak:(BlockObject1BlockWeak)block;

/**
 *  block 带一个参数
 *
 *  @param para1 para1 description
 *  @param block block description
 */
- (void)requestBlockWithParameter:(NSString *)para1 block:(BlockObject1BlockPara1)block;

/**
 timer

 @param block block description
 */
- (void)requestWithTimer:(BlockObject1BlockStrong)block;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////

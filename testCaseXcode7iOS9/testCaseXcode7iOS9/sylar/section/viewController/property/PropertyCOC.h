//
//  PropertyCOC.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/4/11.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PropertyCOC : NSObject
{
    @public
    NSInteger apple1;
    NSInteger pear2;
}

@property (nonatomic, assign) NSInteger monkey3;
@property (nonatomic, assign) NSInteger tiger4;
@property (nonatomic, assign) NSInteger snake5;

- (void)show;

@end

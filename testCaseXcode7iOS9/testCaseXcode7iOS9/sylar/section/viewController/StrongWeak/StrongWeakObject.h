//
//  StrongWeakObject.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/3/2.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StrongWeakObject : NSObject

@property (nonatomic, assign) NSInteger value;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, weak) UIColor *colorWeak;

@end

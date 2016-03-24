//
//  TimerObject.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/24.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerObject : NSObject

@property (nonatomic, weak) id delegate;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, strong) NSString *name;

@end

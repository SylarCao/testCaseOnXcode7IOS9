//
//  StringArrayObj1.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/6/20.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
typedef void (^StringArrayObj1Block)(NSString *data);
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface StringArrayObj1 : NSObject

@property (nonatomic, strong) NSString* p1;
@property (nonatomic, copy) NSString *p2;

@property (nonatomic, strong) NSMutableString *p3;
@property (nonatomic, copy) NSMutableString *p4;

@property (nonatomic, strong) NSArray *a1;
@property (nonatomic, copy) NSArray *a2;

@property (nonatomic, strong) NSMutableArray *a3;
@property (nonatomic, copy) NSMutableArray *a4;

@property (nonatomic, strong) StringArrayObj1Block b1;
@property (nonatomic, copy) StringArrayObj1Block b2;

@end

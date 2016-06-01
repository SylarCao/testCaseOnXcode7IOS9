//
//  DataObject1.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/6/1.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataObject1 : NSObject <NSCoding>

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) BOOL valid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) CGFloat score;


@property (nonatomic, strong) NSArray *array;


- (id)initWithRandom0;


- (id)initWithRandom1;

@end

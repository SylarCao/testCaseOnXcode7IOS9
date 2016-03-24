//
//  EncoderObject.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/24.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EncoderObject1.h"

@interface EncoderObject : EncoderObject1 

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSString *score;


- (void)show;


@end

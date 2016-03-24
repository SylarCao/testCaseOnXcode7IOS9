//
//  EncoderObject1.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/24.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import "EncoderObject1.h"

@implementation EncoderObject1

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_ppp1 forKey:@"ppp1"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _ppp1 = [aDecoder decodeObjectForKey:@"ppp1"];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _ppp1 = @"init";
    }
    return self;
}

@end

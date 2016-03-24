//
//  EncoderObject.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/24.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import "EncoderObject.h"

@implementation EncoderObject

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInteger:_age forKey:@"age"];
    [aCoder encodeObject:_score forKey:@"score"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _age = [aDecoder decodeIntegerForKey:@"age"];
        _score = [aDecoder decodeObjectForKey:@"score"];
    }
    return self;
}

- (void)show
{
    NSLog(@"name = %@, age = %ld, socre= %@, ppp = %@", _name, _age, _score, self.ppp1);
}

@end

//
//  DataObject1.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/6/1.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import "DataObject1.h"

@implementation DataObject1

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_color forKey:@"color"];
    [aCoder encodeObject:[NSNumber numberWithBool:_valid] forKey:@"valid"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:[NSNumber numberWithFloat:_score] forKey:@"score"];
    [aCoder encodeObject:_array forKey:@"array"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _color = [aDecoder decodeObjectForKey:@"color"];
        _valid = [[aDecoder decodeObjectForKey:@"valid"] boolValue];
        _name = [aDecoder decodeObjectForKey:@"name"];
        _score = [[aDecoder decodeObjectForKey:@"score"] floatValue];
        _array = [aDecoder decodeObjectForKey:@"array"];
    }
    return self;
}

- (id)initWithRandom0
{
    self = [super init];
    if (self)
    {
        _color = [UIColor colorWithRed:0.8 green:0.2 blue:0 alpha:0.2];
        _valid = YES;
        _name = @"name111";
        _score = 4.553;
    }
    return self;
}

- (id)initWithRandom1
{
    self = [super init];
    if (self)
    {
        _color = [UIColor colorWithRed:0.8 green:0.2 blue:0.7 alpha:0.2];
        _valid = YES;
        _name = @"name111";
        _score = 4.553;
        _array = @[@"123", [NSNumber numberWithBool:YES], @"4.56", [NSNumber numberWithFloat:3.44], [[DataObject1 alloc] initWithRandom0]];
    }
    return self;
}




@end

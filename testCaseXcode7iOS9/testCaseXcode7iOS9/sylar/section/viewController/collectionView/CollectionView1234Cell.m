//
//  CollectionView1234Cell.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/9/13.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import "CollectionView1234Cell.h"

@implementation CollectionView1234Cell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSLog(@"init CollectionView1234Cell");
    }
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    NSLog(@"prepareForReuse CollectionView1234Cell");
}


@end

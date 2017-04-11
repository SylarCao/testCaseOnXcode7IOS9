//
//  PropertyCOC.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/4/11.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "PropertyCOC.h"

@interface PropertyCOC ()
{
    NSInteger boy6;
    NSInteger girl7;
}

@property (nonatomic, assign) NSInteger teacher8;
@property (nonatomic, assign) NSInteger student9;

@end

@implementation PropertyCOC

- (id)init {
    self = [super init];
    if (self) {
        apple1 = 21;
        pear2 = 22;
        _monkey3 = 23;
        _tiger4 = 24;
        _snake5 = 25;
        boy6 = 26;
        girl7 = 27;
        _teacher8 = 28;
        _student9 = 29;
    }
    return self;
}

- (void)show {
    NSLog(@"sylar :  1(%ld), 2(%ld), 3(%ld), 4(%ld), 5(%ld), 6(%ld), 7(%ld), 8(%ld), 9(%ld)", apple1, pear2, _monkey3, _tiger4, _snake5, boy6, girl7, _teacher8, _student9);
}

@end

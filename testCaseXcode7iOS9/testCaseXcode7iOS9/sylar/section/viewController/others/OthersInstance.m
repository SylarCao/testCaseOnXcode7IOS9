//
//  OthersInstance.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/30.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "OthersInstance.h"
#import "OtherObjectHelper.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface OthersInstance()


@property (nonatomic, strong) NSMutableArray *arrayVCTL;  // 放viewcontroller的array

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation OthersInstance

+ (instancetype)share
{
    static OthersInstance *inst = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        inst = [[OthersInstance alloc] init];
    });
    return inst;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _arrayVCTL = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addVCTL:(UIViewController *)aViewController
{
    if (_arrayVCTL == nil)
    {
        NSLog(@"nil");
    }
//    OtherObjectHelper *oo = [[OtherObjectHelper alloc] init];
//    oo.aViewcontroller = aViewController;
    [_arrayVCTL addObject:aViewController];
    
}

@end

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
    
    // 使用 weak
    OtherObjectHelper *oo = [[OtherObjectHelper alloc] init];
    oo.aViewcontroller = aViewController;
    [_arrayVCTL addObject:oo];
    
    
//    // 使用 valueWithNonretainedObject
//    id obj = [NSValue valueWithNonretainedObject:aViewController];
//    [_arrayVCTL addObject:obj];
//    if (_arrayVCTL.count > 1)
//    {
//        NSValue *o1 = [_arrayVCTL lastObject];
//        UIView *v1 = o1.nonretainedObjectValue;
//        NSLog(@"v1 = %@", v1);
//    }
    
}

@end

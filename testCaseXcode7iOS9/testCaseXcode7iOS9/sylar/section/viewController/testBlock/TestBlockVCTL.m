//
//  TestBlockVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/8.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TestBlockVCTL.h"
#import "BlockObject1.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TestBlockVCTL ()

@property (nonatomic, strong) BlockObject1BlockStrong strong;

@property (nonatomic, strong) BlockObject1BlockWeak weak;

@property (nonatomic, strong) BlockObject1 *obj;

@property (nonatomic, strong) NSString *string1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TestBlockVCTL

- (void)dealloc
{
    NSLog(@"dealloc");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _string1 = @"init_value";
}

- (IBAction)btn1:(id)sender
{
    [self funPara1];
}

- (void)fun1
{
    BlockObject1 *block1 = [[BlockObject1 alloc] init];
    [block1 requestBlockStrong:^(NSString *data) {
        NSLog(@"ss = %@", data);
    }];
}

- (void)fun2
{
    BlockObject1 *b1 = [[BlockObject1 alloc] init];
    [b1 requestBlockWeak:^(NSString *data) {
        NSLog(@"ww = %@", data);
    }];
}

- (void)fun3
{
    BlockObject1BlockStrong block1 = ^(NSString *data){
        NSLog(@"s = %@", data);
    };
    _strong = block1;
    BlockObject1 *bb1 = [[BlockObject1 alloc] init];
    [bb1 requestBlockStrong:_strong];
}

- (void)fun4
{
    BlockObject1BlockWeak block1 = ^(NSString *data){
        NSLog(@"w = %@", data);
    };
    _weak = block1;
    BlockObject1 *bb1 = [[BlockObject1 alloc] init];
    [bb1 requestBlockWeak:_weak];
}

- (void)funPara1
{
    BlockObject1 *obj1 = [[BlockObject1 alloc] init];
    NSString *ss = _string1;
    [obj1 requestBlockWithParameter:ss block:^(NSString *data) {
        NSLog(@"ss = %@", ss);
        NSLog(@"data = %@", data);
        NSLog(@"para1 = %@", _string1);
        
        if ([_string1 isEqualToString:data])
        {
            NSLog(@"same");
        }
        else
        {
            NSLog(@"not same");
        }
    }];
    
    _string1 = @"another";
}

@end

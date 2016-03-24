//
//  EncoderVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/24.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "EncoderVCTL.h"
#import "EncoderObject.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface EncoderVCTL ()

@property (nonatomic, strong) NSData *data1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation EncoderVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fun1];
}

- (IBAction)btn1:(id)sender
{
    [self fun2];
}

- (void)fun2
{
    if (_data1)
    {
        EncoderObject *obj1 = [NSKeyedUnarchiver unarchiveObjectWithData:_data1 ];
        [obj1 show];
    }
    else
    {
        NSLog(@"no data");
    }
}

- (void)fun1
{
    EncoderObject *o1 = [[EncoderObject alloc] init];
    o1.name = @"this is name";
    o1.age = 12;
    o1.score = @"45";
    o1.ppp1 = @"ppp";
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:o1];
    _data1 = data;
}

@end

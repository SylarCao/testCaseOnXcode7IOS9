//
//  JsonKitVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/15.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "JsonKitVCTL.h"
#import "JSONKit.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface JsonKitVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation JsonKitVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)btn1:(id)sender
{
    NSInteger int1 = 1;
    NSInteger int2 = 2;
    NSInteger int3 = 0-5;
    NSArray *arr1 = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"%ld", int1], [NSString stringWithFormat:@"%ld", int2], [NSString stringWithFormat:@"%ld", int3], nil];
    
    NSArray *arr2 = [[NSArray alloc] initWithObjects:@"1", @"2", @"-5", nil];
    
    NSArray *arr3 = [[NSArray alloc] initWithObjects:[[NSString alloc] initWithFormat:@"%ld", int1], [[NSString alloc] initWithFormat:@"%ld", int2], [[NSString alloc] initWithFormat:@"%ld", int3], nil];
    
    NSArray *arr4 = [[NSArray alloc] initWithObjects:[NSNumber numberWithInteger:int3], nil];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          //                          @"obj1", @"key1",
                          arr1, @"array1",
                          arr2, @"array2",
                          nil];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
    NSData *dd = [arr1 JSONString];
#pragma clang diagnostic pop
    NSLog(@"");
}



@end

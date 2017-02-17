//
//  StrongWeakVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/2/17.
//  Copyright © 2017年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "StrongWeakVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface StrongWeakVCTL ()

@property (nonatomic, weak) NSMutableArray *array1;


@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation StrongWeakVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _array1 = [[NSMutableArray alloc] initWithObjects:@"a", @"b", @"c", nil];
    _array1 = [NSMutableArray arrayWithObjects:@"a", @"b", @"c", nil];
}

- (IBAction)btn1:(id)sender {
    NSLog(@"sylar :  btn1");
}



@end

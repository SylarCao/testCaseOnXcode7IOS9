//
//  NumberVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/7/25.
//  Copyright © 2018年 sylar. All rights reserved.
//

#import "NumberVCTL.h"

@interface NumberVCTL ()

@end

@implementation NumberVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender {
    NSLog(@"sylar : 1111");
    
    
}

- (IBAction)btn2:(id)sender {
    NSLog(@"sylar : 2222");
    
    NSString *s1 = @"u87";
//    s1 = [[NSObject alloc] init];  // crash
    s1 = nil;  // 0
    NSInteger a1 = [s1 integerValue];
    CGFloat a2 = 6*5-30.00000;
    a1 = 1/a2;  // 0
    NSLog(@"sylar : a1 = %ld", (long)s1.integerValue);
}

@end

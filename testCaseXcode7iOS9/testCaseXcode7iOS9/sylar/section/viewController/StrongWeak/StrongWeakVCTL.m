//
//  StrongWeakVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/2/17.
//  Copyright © 2017年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "StrongWeakVCTL.h"
#import "StrongWeakObject.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface StrongWeakVCTL ()

@property (nonatomic, weak) NSMutableArray *array1;

@property (nonatomic, strong) StrongWeakObject *obj1;
@property (nonatomic, strong) StrongWeakObject *obj2;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation StrongWeakVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _array1 = [[NSMutableArray alloc] initWithObjects:@"a", @"b", @"c", nil];
    _array1 = [NSMutableArray arrayWithObjects:@"a", @"b", @"c", nil];
    
//    [self fun1];
    
//    [self fun2];
    
    [self fun3];
}

- (IBAction)btn1:(id)sender {
    NSLog(@"sylar :  btn1");
    
//    [self fun1];
}

- (void)fun1 {
    UIColor *c1 = [UIColor redColor];
    _obj1 = [[StrongWeakObject alloc] init];
    _obj1.color = c1;
    c1 = [UIColor blueColor];
    _obj2 = [[StrongWeakObject alloc] init];
    _obj2.color = c1;
    c1 = [UIColor yellowColor];
    
    // obj1.color = red
    // obj2.color = blue
}

- (void)fun2 {
    UIColor *c1 = [UIColor redColor];
    _obj1 = [[StrongWeakObject alloc] init];
    _obj1.colorWeak = c1;
    c1 = [UIColor blueColor];
    _obj2 = [[StrongWeakObject alloc] init];
    _obj2.color = c1;
    c1 = [UIColor yellowColor];
    
    // obj1.weakColor = red
    // obj2.color = blue
}

- (void)fun3 {
    UIColor *c1 = [UIColor redColor];
    _obj1 = [[StrongWeakObject alloc] init];
    _obj1.color = c1;
    c1 = [UIColor blueColor];
    _obj2 = [[StrongWeakObject alloc] init];
    _obj2.colorWeak = _obj1.color;
    c1 = [UIColor yellowColor];
    _obj1.color = [UIColor greenColor];
    
    // obj1.color = green
    // obj2.weakColor = red
}

@end

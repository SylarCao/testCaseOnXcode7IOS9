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
@property (nonatomic, weak) NSString *ws1;
@property (nonatomic, weak) UIColor *wc1;
@property (nonatomic, strong) NSString *ss2;
@property (nonatomic, copy) NSString *cs3;

@property (nonatomic, strong) StrongWeakObject *obj1;
@property (nonatomic, strong) StrongWeakObject *obj2;

@property (nonatomic, strong) NSArray *arr1;
@property (nonatomic, copy) NSArray *arr2;

@property (nonatomic, strong) NSMutableArray *marr1;
@property (nonatomic, copy) NSMutableArray *marr2;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation StrongWeakVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _array1 = [[NSMutableArray alloc] initWithObjects:@"a", @"b", @"c", nil];
    _array1 = [NSMutableArray arrayWithObjects:@"a", @"b", @"c", nil];
    _ws1 = @"my s1";
    _wc1 = [UIColor whiteColor];
    
//    [self fun1];
    
//    [self fun2];
    
//    [self fun3];
    
//    [self fun4];
    
//    [self fun5];
    
    [self fun6];
}

- (IBAction)btn1:(id)sender {
    NSLog(@"sylar :  btn1");
    
//    [self fun1];
}

- (void)fun7 {
    UIColor *c1 = [UIColor colorWithRed:0.5 green:0.6 blue:0.7 alpha:1];
//    c1.
}

- (void)fun6 {
    StrongWeakObject *obj1 = [[StrongWeakObject alloc] init];
    obj1.value = 1;
    
    NSMutableArray *a1 = [[NSMutableArray alloc] initWithObjects:@"1", @"2", obj1, @"3", nil];
    self.marr1 = a1;
    self.marr2 = a1;
    
    obj1.value = 2;
    
    [a1 addObject:@"5"];
    
    NSLog(@"sylar :  a1 = %@", a1);
}

- (void)fun5 {
    
    StrongWeakObject *obj1 = [[StrongWeakObject alloc] init];
    obj1.value = 1;
    
    NSArray *a1 = @[@"1", @"2", @"4", obj1];
    self.arr1 = a1;
    self.arr2 = a1;
    
    obj1.value = 2;
    
    NSLog(@"sylar :  a1 = %@", a1);
    
}

- (void)fun4 {
    NSString *s1 = @"s1111";   // NSCFConstantString
    NSString *s2 = [s1 copy];  // NSCFConstantString
    NSString *s3 = [s1 mutableCopy];  // NSCFString
    NSString *s4 = [[s1 mutableCopy] copy];  // NSTaggedPointerString
    
    self.ws1 = s1;
    self.ss2 = s1;
    self.cs3 = s1;
    NSLog(@"sylar :  s1 = %@", s1);  // 3个地址都一样
    
    s1 = @"s222";
    NSLog(@"sylar :  s1 = %@", s1);
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

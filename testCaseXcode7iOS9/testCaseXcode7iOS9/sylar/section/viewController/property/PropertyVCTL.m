//
//  PropertyVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/3/21.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "PropertyVCTL.h"
#import "PropertyC1.h"
#import "PropertyOC1.h"
#import "PropertyOC2.h"
#import "PropertyC2.h"
#import "PropertyOCO2ag.h"
#import "PropertyCOC.h"
#import "PropertyC100.h"


/*
 * 手动实现了getter方法，编译的时候就只生成setter方法和成员变量
 * 手动实现了setter方法，编译的时候就只生成getter方法和成员变量
 * getter、setter方法都手动实现了，它将不会生成成员变量，并且会报错
 */

@interface PropertyVCTL ()
{
    NSString *_bothGetterSetterProperty;
}

@property (nonatomic, strong) NSString *myProperty1;

@property (nonatomic, strong) NSString *onlySetterProperty;
@property (nonatomic, strong) NSString *onlyGetterProperty;
@property (nonatomic, strong) NSString *bothGetterSetterProperty;


@property (nonatomic, assign) NSInteger myInt1;

@end

@implementation PropertyVCTL
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self fun1];
    
//    [self fun2];
    
//    [self fun3];
    
//    [self fun4];
    
//    [self fun5];
    
    [self fun6];

}

- (IBAction)btn1:(id)sender {
    NSLog(@"sylar :  btn1");
    NSLog(@"sylar :  int1 = %ld", _myInt1);
}

- (void)fun6 {
    PropertyCOC *oco = [[PropertyCOC alloc] init];
    [oco show]; //  1(21), 2(22), 3(23), 4(24), 5(25), 6(26), 7(27), 8(28), 9(29)
    
    PropertyC100 *c100 = oco;
    c100->a1 = 41;
    c100->a2 = 42;
    c100->a3 = 43;
    c100->a4 = 44;
    c100->a5 = 45;
    c100->a6 = 46;
    c100->a7 = 47;
    c100->a8 = 48;
    [c100 show];  // 1(41), 2(42), 3(45), 4(46), 5(47), 6(43), 7(44), 8(48), 9(29)
    
}

- (void)fun5 {
    PropertyOC2 *v1 = [[PropertyOC2 alloc] init];
    [v1 show];
    
    PropertyOCO2ag *ag = v1;
    ag.a2 = 100;  // crash
    [ag show];
    
}

- (void)fun4 {
    PropertyOC2 *c2 = [[PropertyOC2 alloc] init];
    c2.value1 = 88;
    c2.monkey2 = 22;
    c2.snake3 = 33;
    [c2 show];  // PropertyOC1 = 88 monkey2(22)  snake3(33)
    
    PropertyC2 *c1 = c2;
    c1->apple2 = 57;  // works fine
    [c1 show];   // PropertyOC1 = 88 monkey2(57)  snake3(33)
    
    c1->melon4 = 28;  // 有时候会在runloop结束后crash
    NSLog(@"sylar :  -------------");
//    NSInteger a1 = c1->apple2;
//    NSInteger a2 = c2.value1 + 100;
//    _myInt1 = c2.monkey2 + 30000;
//    NSLog(@"sylar :  a1 = %ld", a2);
//    [c1 show];
    NSLog(@"sylar :  +++++++++++++");
}

- (void)fun3 {
    PropertyOC1 *c2 = [[PropertyOC1 alloc] init];
    c2.value = 88;
    [c2 show];
    
    PropertyC1 *c1 = c2;
    c1->number = 33;  // works fine
    [c1 show];
}

- (void)fun2 {
    PropertyC1 *c1 = [[PropertyC1 alloc] init];
    c1->number = 99;
    [c1 show];
    
    PropertyOC1 *c2 = (PropertyC1 *)c1;
    c2.value = 88;  // crash
    [c2 show];
}
#pragma clang diagnostic pop

- (void)fun1 {
    self.onlySetterProperty = @"only setter";  // log  setOnlySetterProperty
    self.onlyGetterProperty = @"only getter";
    self.bothGetterSetterProperty = @"both";   // log  setBothGetterSetterProperty
    
    NSString *s1 = self.onlySetterProperty;
    NSString *s2 = self.onlyGetterProperty;    // log  onlyGetterProperty
    NSString *s3 = self.bothGetterSetterProperty; // log  bothGetterSetterProperty
}


#pragma mark - self property
- (void)setMyProperty1:(NSString *)myProperty1 {
    NSLog(@"sylar :  setMyProperty1");
}

- (NSString *)myProperty1 {
    NSLog(@"sylar :  myProperty1");
    return @"abc";
}

- (void)setOnlySetterProperty:(NSString *)onlySetterProperty {
    _onlyGetterProperty = onlySetterProperty;
    NSLog(@"sylar :  setOnlySetterProperty");
}

- (NSString *)onlyGetterProperty {
    NSLog(@"sylar :  onlyGetterProperty");
    return _onlyGetterProperty;
}

- (void)setBothGetterSetterProperty:(NSString *)bothGetterSetterProperty {
    NSLog(@"sylar :  setBothGetterSetterProperty");
    _bothGetterSetterProperty = bothGetterSetterProperty;
}

- (NSString *)bothGetterSetterProperty {
    NSLog(@"sylar :  bothGetterSetterProperty");
    return _bothGetterSetterProperty;
}


@end

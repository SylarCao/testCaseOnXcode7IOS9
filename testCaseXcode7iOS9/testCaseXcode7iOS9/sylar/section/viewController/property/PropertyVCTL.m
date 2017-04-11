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

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self fun1];
    
//    [self fun2];
    
//    [self fun3];
    
    [self fun4];

}

- (IBAction)btn1:(id)sender {
    NSLog(@"sylar :  btn1");
    NSLog(@"sylar :  int1 = %ld", _myInt1);
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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
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

//
//  PropertyVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/3/21.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "PropertyVCTL.h"

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

@end

@implementation PropertyVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fun1];
}

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

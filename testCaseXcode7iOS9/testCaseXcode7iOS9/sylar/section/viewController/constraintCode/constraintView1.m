//
//  constraintView1.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/18.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "constraintView1.h"
#import "Helper.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface constraintView1()

@property (nonatomic, strong) UIView *v1;
@property (nonatomic, strong) UIView *v2;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation constraintView1

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setInitialValue];
        
//        [self fun1];
//        [self fun2];
//        [self fun3];
        [self fun4];
    }
    return self;
}

- (void)setInitialValue
{
    self.backgroundColor = [[Helper share] getRandomColorWithAlpha:0.4];
    
    _v1 = [[UIView alloc] init];
    _v1.translatesAutoresizingMaskIntoConstraints = NO;
    _v1.backgroundColor = [[Helper share] getRandomColor];
    [self addSubview:_v1];
    
    _v2 = [[UIView alloc] init];
    _v2.translatesAutoresizingMaskIntoConstraints = NO;
    _v2.backgroundColor = [[Helper share] getRandomColor];
    [self addSubview:_v2];
}



- (void)fun4
{
    //  center
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_v1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_v1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_v1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    
    
    
}


- (void)fun1
{
    // equal width  相同宽度
    NSDictionary *dict = NSDictionaryOfVariableBindings(_v1, _v2);
    NSArray *c1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(20)-[_v1]-20-|" options:NSLayoutFormatAlignAllCenterX|NSLayoutFormatAlignAllCenterY metrics:nil views:dict];
    NSArray *c2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_v2]-20-|" options:NSLayoutFormatAlignAllCenterX|NSLayoutFormatAlignAllCenterY metrics:nil views:dict];
    
    NSArray *c3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_v1]-40-[_v2]-20-|" options:0 metrics:nil views:dict];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_v1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_v2 attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    
    [self addConstraints:c1];
    [self addConstraints:c2];
    [self addConstraints:c3];
}

- (void)fun2
{
    // 百分比
    NSDictionary *dict = NSDictionaryOfVariableBindings(_v1, _v2);
    NSArray *c1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_v1]-20-|" options:NSLayoutFormatAlignAllCenterX|NSLayoutFormatAlignAllCenterY metrics:nil views:dict];
    NSArray *c2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_v2]-20-|" options:NSLayoutFormatAlignAllCenterX|NSLayoutFormatAlignAllCenterY metrics:nil views:dict];
    
    NSArray *c3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_v1]-0-[_v2]-0-|" options:0 metrics:nil views:dict];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_v1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
    
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:_v1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:80]];
    
    [self addConstraints:c1];
    [self addConstraints:c2];
    [self addConstraints:c3];
}

- (void)fun3
{
    // 用变量来代替 数字
    NSDictionary *dict = NSDictionaryOfVariableBindings(_v1);
    
    NSDictionary *d1 = @{@"spacing1": @"50"};
    
    NSArray *c1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-spacing1-[_v1]-20-|" options:0 metrics:d1 views:dict];
    
    NSArray *c2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_v1]-20-|" options:0 metrics:nil views:dict];
    
    [self addConstraints:c1];
    [self addConstraints:c2];
    
}


@end

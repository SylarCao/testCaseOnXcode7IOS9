//
//  HorizontalView2.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/7.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "HorizontalView2.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface HorizontalView2()



@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation HorizontalView2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self fun1];
        [self fun2];
        
        self.layer.borderColor = [UIColor blueColor].CGColor;
        self.layer.borderWidth = 1;
        
        
    }
    return self;
}

- (void)fun2
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView)];
    [self addGestureRecognizer:tap];
}

- (void)publicFun1
{
    NSLog(@"size = %f, %f", self.frame.size.width, self.frame.size.height);
    UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectZero];
    l1.translatesAutoresizingMaskIntoConstraints = NO;
    l1.text = @"l1";
    l1.textAlignment = NSTextAlignmentCenter;
    [self addSubview:l1];
    l1.backgroundColor = [UIColor redColor];
    
    // constraints
    NSDictionary *dict = NSDictionaryOfVariableBindings(l1);
    NSArray *c1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[l1]-0-|" options:NSLayoutFormatDirectionRightToLeft metrics:nil views:dict];
    NSArray *c2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[l1]-10-|" options:NSLayoutFormatDirectionRightToLeft metrics:nil views:dict];
    [self addConstraints:c1];
    [self addConstraints:c2];
}

- (void)publicFun2
{
    NSLog(@"size = %f, %f", self.frame.size.width, self.frame.size.height);
    UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectZero];
    l1.translatesAutoresizingMaskIntoConstraints = NO;
    l1.text = @"l2";
    l1.textAlignment = NSTextAlignmentCenter;
    [self addSubview:l1];
    l1.backgroundColor = [UIColor yellowColor];
    
    // constraints
    NSDictionary *dict = NSDictionaryOfVariableBindings(l1);
    NSArray *c1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[l1]-0-|" options:0 metrics:nil views:dict];
    NSArray *c2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[l1]-0-|" options:0 metrics:nil views:dict];
    [self addConstraints:c1];
    [self addConstraints:c2];
}

- (void)fun1
{
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectZero];
    v1.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:v1];
    v1.backgroundColor = [UIColor redColor];
    
    // constraints
    NSDictionary *dict = NSDictionaryOfVariableBindings(v1);
    NSArray *c1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[v1]-0-|" options:NSLayoutFormatAlignAllLeft metrics:nil views:dict];
    NSArray *c2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[v1]-20-|" options:0 metrics:nil views:dict];
    [self addConstraints:c1];
    [self addConstraints:c2];
}

- (void)tapView
{
    NSLog(@"tap");
}

@end

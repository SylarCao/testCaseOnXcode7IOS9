//
//  ConstraintCodeVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/18.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ConstraintCodeVCTL.h"
#import "constraintView1.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ConstraintCodeVCTL ()

@property (nonatomic, strong) constraintView1 *v1;

@property (nonatomic, strong) NSLayoutConstraint *v1Width;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ConstraintCodeVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self fun1];
}

- (void)fun1
{
    _v1 = [[constraintView1 alloc] init];
    _v1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_v1];
    
    // constraint
    NSDictionary *dict = NSDictionaryOfVariableBindings(_v1);
    NSArray *c1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_v1]-20-|" options:NSLayoutFormatAlignAllCenterX|NSLayoutFormatAlignAllCenterY metrics:nil views:dict];
    for (NSLayoutConstraint *each_constraint in c1)
    {
        if (each_constraint.firstItem == _v1 && each_constraint.secondItem == nil)
        {
            _v1Width = each_constraint;
            break;
        }
    }
    NSArray *c2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_v1(==200)]-30-|" options:0 metrics:nil views:dict];
    [self.view addConstraints:c1];
    [self.view addConstraints:c2];
}


- (IBAction)btn1:(id)sender
{
    
}

- (IBAction)btn2:(id)sender
{
    
}

@end

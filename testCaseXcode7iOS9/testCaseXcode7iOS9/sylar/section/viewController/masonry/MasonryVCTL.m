//
//  MasonryVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/9/21.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "MasonryVCTL.h"
#import "Masonry.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface MasonryVCTL ()

@property (nonatomic, strong) UIView *v1;

@property (nonatomic, weak) MASConstraint *bottomConstraint;

@property (nonatomic, weak) MASConstraint *rightConstraint;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation MasonryVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setInitialValue];
}

- (IBAction)btn1:(id)sender
{
    NSLog(@"btn1");
    
    [self fun1];
}

- (void)setInitialValue
{
    
    [self.view addSubview:self.v1];
    [self addV1Constraints];
}

- (void)fun1
{
    //  下边2个都可以
    _bottomConstraint.offset(-90);
    _bottomConstraint.offset = -90;
    
    _rightConstraint.offset = -100;
}


#pragma mark - self property
- (UIView *)v1
{
    if (_v1 == nil)
    {
        _v1 = [[UIView alloc] initWithFrame:CGRectZero];
        _v1.translatesAutoresizingMaskIntoConstraints = NO;
        _v1.backgroundColor = [UIColor redColor];
    }
    return _v1;
}

- (void)addV1Constraints
{
    NSArray *a1 = [_v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(20);
        
        // 距离约束
//        make.right.offset = self.view.mas_right.layoutAttribute-40;  // not correct
        make.right.offset = -40;   // correct
        make.right.equalTo(self.view.mas_right).with.offset(-40);  // correct
        
        _rightConstraint = make.right;
        _rightConstraint.offset = -40;

        
        // 用property  bottom
        _bottomConstraint = make.bottom.equalTo(self.view.mas_bottom);
        _bottomConstraint.with.offset(-50);
        
        // center
//        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(1.5);
        
        
        // 固定 高度
//        make.height.equalTo(@60);
//        make.height.offset = 60;
        
        // 比例 高度
        make.width.equalTo(_v1.mas_height).multipliedBy(9);  // width = height * 9
//        make.width.multipliedBy = _v1.mas_height.layoutAttribute*10; // 不能这么写
    }];
    
//    NSLog(@"a1 = %@", a1);   // 有4个约束
}

@end

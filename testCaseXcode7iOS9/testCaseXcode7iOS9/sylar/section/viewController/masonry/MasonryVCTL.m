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
@property (nonatomic, weak) MASConstraint *centerXConstraint;


@property (nonatomic, strong) UIView *vv1;
@property (nonatomic, strong) UIView *vv2;

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
    [self.view addSubview:self.vv1];
    [self addVV1Constraints];
    
    [self.view addSubview:self.vv2];
    [self addVV2Constraints];
    
    [self.view addSubview:self.v1];
    [self addV1Constraints];
}

- (void)fun1
{
    //  下边2个都可以
//    _bottomConstraint.offset(-90);
//    _bottomConstraint.offset = -90;
    
//    _rightConstraint.offset = -100;
    
    // 动画变   no annimation
//    [UIView animateWithDuration:1 animations:^{
//        _bottomConstraint.offset(-90);
//    }];
    
    
    // centerX 修改
    [_centerXConstraint uninstall];  // 写在里边和外边都可以
    [_v1 mas_updateConstraints:^(MASConstraintMaker *make) {
//        _centerXConstraint.equalTo(_vv2.mas_centerX).with.offset(0);
//        [_centerXConstraint uninstall];
        make.centerX.equalTo(_vv2.mas_centerX).with.offset(0);
    }];
    
    
}


#pragma mark - self property
- (UIView *)vv1
{
    if (_vv1 == nil)
    {
        _vv1 = [[UIView alloc] initWithFrame:CGRectZero];
        _vv1.translatesAutoresizingMaskIntoConstraints = NO;
        _vv1.backgroundColor = [UIColor blueColor];
    }
    return _vv1;
}

- (void)addVV1Constraints
{
    [_vv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset = 400;
        make.left.offset = 10;
        make.width.offset = 60;
        make.height.offset = 20;
    }];
}

- (UIView *)vv2
{
    if (_vv2 == nil)
    {
        _vv2 = [[UIView alloc] initWithFrame:CGRectZero];
        _vv2.translatesAutoresizingMaskIntoConstraints = NO;
        _vv2.backgroundColor = [UIColor yellowColor];
    }
    return _vv2;
}

- (void)addVV2Constraints
{
    [_vv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset = 400;
        make.left.offset = 150;
        make.width.offset = 60;
        make.height.offset = 20;
    }];
}

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
//        make.left.equalTo(self.view.mas_left).with.offset(20);
        
        // 距离约束
//        make.right.offset = self.view.mas_right.layoutAttribute-40;  // not correct
//        make.right.offset = -40;   // correct
//        make.right.equalTo(self.view.mas_right).with.offset(-40);  // correct
        
//        _rightConstraint = make.right;
//        _rightConstraint.offset = -40;

        
        // 用property  bottom
        _bottomConstraint = make.bottom.equalTo(self.view.mas_bottom);
        _bottomConstraint.with.offset(-50);
        
        // center
//        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(1.5);
        
        
        // 固定 高度
//        make.height.equalTo(@60);
        make.height.offset = 20;
        
        // 比例 高度
        make.width.equalTo(_v1.mas_height).multipliedBy(2);  // width = height * 9
//        make.width.multipliedBy = _v1.mas_height.layoutAttribute*10; // 不能这么写
        
        // center x
        _centerXConstraint = make.centerX.equalTo(_vv1.mas_centerX).with.offset(0);
    }];
    
    NSLog(@"a1 = %@", a1);   // 有4个约束
}

@end




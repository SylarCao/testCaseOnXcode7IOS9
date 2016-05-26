//
//  ShakeTextFieldVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/9/29.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ShakeTextFieldVCTL.h"
#import "UITextField+Shake.h" //https://github.com/andreamazz/UITextField-Shake
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ShakeTextFieldVCTL ()

@property (nonatomic, weak) IBOutlet UITextField *textField1;

@property (nonatomic, weak) IBOutlet UIView *v1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ShakeTextFieldVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self fun1];
}


- (IBAction)btn1:(id)sender
{
//    [_textField1 shake];
//    _v1.translatesAutoresizingMaskIntoConstraints = YES;
    [self shake1:M_PI/4 times:10 first:1];
}

- (IBAction)btn2:(id)sender
{
//    [self shake1:10];
    
    
}

- (void)shake1:(CGFloat)direction times:(NSInteger)times first:(BOOL)firstTime
{
    kReturnCondition(times<0, @"");
    CGFloat rotation = direction;
    if (firstTime || times == 0)
    {
        rotation = rotation/2;
    }
    [UIView animateWithDuration:0.07 animations:^{
        _v1.transform = CGAffineTransformRotate(_v1.transform, rotation);
    } completion:^(BOOL finished) {
        if (finished)
        {
            [self shake1:direction*(-1) times:times-1 first:NO];
        }
    }];
}


- (void)fun2
{
    
}


- (void)fun1
{
    UITextField *t1 = [[UITextField alloc] init];
    t1.frame = CGRectMake(100, 200, 100, 40);
    [self.view addSubview:t1];
    t1.borderStyle = UITextBorderStyleRoundedRect;
    t1.layer.borderColor = [UIColor redColor].CGColor;
    t1.layer.borderWidth = 1;
}


@end

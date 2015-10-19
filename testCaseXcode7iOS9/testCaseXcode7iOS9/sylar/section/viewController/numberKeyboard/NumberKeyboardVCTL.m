//
//  NumberKeyboardVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/16.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "NumberKeyboardVCTL.h"
#import "AppDelegate.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface NumberKeyboardVCTL ()
<UITextFieldDelegate>

@property (nonatomic, strong) UIView *v1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NumberKeyboardVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"begin editing");
//    [self addMinusIcon];
}

- (IBAction)btn1Tap:(id)sender
{
    [self addMinusIcon];
}

- (void) addMinusIcon
{
    if (_v1 == nil)
    {
        _v1 = [[UIView alloc] init];
        _v1.frame = CGRectMake(0, 480, 50, 200);
        _v1.backgroundColor = [UIColor redColor];
        
        
//        [[[UIApplication sharedApplication].delegate window] addSubview:_v1];
        
        [[[UIApplication sharedApplication].windows lastObject] addSubview:_v1];
        
    }
}


@end

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

// reference http://stackoverflow.com/questions/6052966/phone-number-formatting
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    int length = [self getLength:textField.text];
    //NSLog(@"Length  =  %d ",length);
    
    if(length == 11)
    {
        if(range.length == 0)
            return NO;
    }
    
    if(length == 3)
    {
        NSString *num = [self formatNumber:textField.text];
        textField.text = [NSString stringWithFormat:@"%@ ",num];
        if(range.length > 0)
            textField.text = [NSString stringWithFormat:@"%@",[num substringToIndex:3]];
    }
    else if(length == 7)
    {
        NSString *num = [self formatNumber:textField.text];
        //NSLog(@"%@",[num  substringToIndex:3]);
        //NSLog(@"%@",[num substringFromIndex:3]);
        textField.text = [NSString stringWithFormat:@"%@ %@ ",[num  substringToIndex:3],[num substringFromIndex:3]];
        if(range.length > 0)
            textField.text = [NSString stringWithFormat:@"%@ %@",[num substringToIndex:3],[num substringFromIndex:3]];
    }
    
    return YES;
}

-(NSString*)formatNumber:(NSString*)mobileNumber
{
    
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
//    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
//    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
//    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
//    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    NSLog(@"%@", mobileNumber);
    
    int length = [mobileNumber length];
    if(length > 10)
    {
        mobileNumber = [mobileNumber substringFromIndex: length-10];
        NSLog(@"%@", mobileNumber);
        
    }
    
    
    return mobileNumber;
}


-(int)getLength:(NSString*)mobileNumber
{
    
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
//    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
//    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
//    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
//    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    int length = [mobileNumber length];
    
    return length;
    
    
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

//
//  StringArrayVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/8.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "StringArrayVCTL.h"
# define kAAA @"abc"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface StringArrayVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation StringArrayVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)btn1:(id)sender
{
//    [self fun1];
    
    [self fun2];
    
    [self fun3];
    
}

- (void) fun1
{
    NSArray *arr = [[NSArray alloc] initWithObjects:@"a1", @"a2", @"a3", nil];
    
    NSString *a2 = @"a2";
    if ([arr containsObject:a2])
    {
        NSLog(@"contain a2");
    }
    else
    {
        NSLog(@"not contain a2");
    }

}

/**
 *  四舍五入
 */
- (void) fun2
{
    NSString *s1 = @"1.2345678";
    
    CGFloat f1 = [s1 floatValue];
    
    NSLog(@"f1 = %.4f", f1);
    
    NSString *s2 = @"1.2";
    CGFloat f2 = s2.floatValue;
    NSLog(@"f2 = %.4f", f2);
    
    
}

- (void)fun3
{
#ifdef kAAA
    NSLog(@"aaa defined 11111");
#endif
    
    
#ifdef kAAA
#undef kAAA
#endif
    
#ifdef kAAA
    NSLog(@"aaa defined 22222");
#endif
}

@end

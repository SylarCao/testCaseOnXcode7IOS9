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
    [self fun1];
    
//    [self fun2];
    
//    [self fun3];
    
//    [self fun4];
    
}

- (void) fun1
{
    NSArray *arr = [[NSArray alloc] initWithObjects:@"a1", @"a2", @"a3", nil];
    
    NSString *a2 = @"a2";
    if ([arr containsObject:a2])
    {
        NSLog(@"contain a2");  // come here
    }
    else
    {
        NSLog(@"not contain a2");
    }
    
    NSArray *arr2 = @[@"123", @"124", @"125", @"126"];
    NSString *s1 = @"123";
    if ([arr2 containsObject:s1])
    {
        NSLog(@"contain  s1");  // come here
    }
    else
    {
        NSLog(@"not contain s1");
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

- (void)fun4
{
    CGFloat f1 = 123456789012345678.12345;
    NSLog(@"f1 = %f", f1);
    int n1 = 12345678901234;

    NSLog(@"n1 = %d", n1);
    
}




@end

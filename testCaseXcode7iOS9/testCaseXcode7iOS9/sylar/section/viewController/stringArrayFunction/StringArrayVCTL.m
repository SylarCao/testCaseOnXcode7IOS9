//
//  StringArrayVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/8.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "StringArrayVCTL.h"
#import "StringArrayHelper.h"
# define kAAA @"abc"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface StringArrayVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////

@implementation StringArrayVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fun6];
    
}

- (IBAction)btn1:(id)sender
{
//    [self fun1];
    
//    [self fun2];
    
//    [self fun3];
    
//    [self fun4];
    
//    [self fun5];
    
//    [self fun7];
    
//    [self fun8];
    
//    [self fun9];
    
    [self fun10];
    
}

- (void)fun10
{
    NSArray *aa = nil;
    NSMutableArray *bb = [[NSMutableArray alloc] initWithArray:aa];
    NSLog(@"bb = %@", bb);
}

- (void)fun9
{
    // array -> mutable array
    
    StringArrayHelper *h1 = [[StringArrayHelper alloc] initWithData:1];
    StringArrayHelper *h2 = [[StringArrayHelper alloc] initWithData:2];
    StringArrayHelper *h3 = [[StringArrayHelper alloc] initWithData:3];
    StringArrayHelper *h4 = [[StringArrayHelper alloc] initWithData:4];
    
    NSArray *a1 = @[h1, h2, h3, h4];
    
    
    NSMutableArray *m1 = [[NSMutableArray alloc] initWithArray:a1];
    NSMutableArray *m2 = [a1 mutableCopy];
    NSMutableArray *m3 = [m1 mutableCopy];
    
    NSLog(@"ddd = %@ - %@ - %@ - %@", a1, m1, m2, m3);
    
    
    
}

- (void)fun8
{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2", nil];
    [self logFun8:dict];
    
//    [dict setValue:@"vv" forKey:@"kk"];  // crash
//    [self logFun8:dict];
    
    
    NSMutableDictionary *dd = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2", nil];
    
    [dd setObject:@"vvv" forKey:@"kk"];
    
    [self logFun8:dd];
    
    [dd setObject:@"obj" forKey:@"key2"];
    [self logFun8:dd];
    
    [dd setValue:@"v2" forKey:@"kkkk"];
    [self logFun8:dd];
}

- (void)logFun8:(NSDictionary *)dict
{
    NSLog(@"dict = %@", dict);
}

- (void)fun7
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [arr addObject:@"1"];
    [arr addObject:@"2"];
    [arr replaceObjectAtIndex:0 withObject:@"a"];
    [arr replaceObjectAtIndex:2 withObject:@"c"];  // crash
    NSLog(@"");
}

- (void)fun6
{
    // extern  string
    NSString *ss = [NSString stringWithFormat:@"abc = %@", constStringArrayHelper1];
    NSLog(@"ss = %@", ss);
}

- (void)fun5
{
    // string size 适应大小
    
    UILabel *lb = [[UILabel alloc] init];
    lb.text = @"12345678901";
    lb.font = [UIFont systemFontOfSize:14];
    lb.backgroundColor = [UIColor redColor];
    [self.view addSubview:lb];
    
    
    CGSize size = [lb sizeThatFits:CGSizeMake(200, 200)];
    NSLog(@"size = %f, %f", size.width, size.height);
    
    lb.frame = CGRectMake(200, 200, size.width, size.height);
    
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

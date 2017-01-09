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
#import "StringArrayObj1.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
# define kAAA @"abc"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface StringArrayVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////

@implementation StringArrayVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self fun6];
    
    [self btn1:nil];
    
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
    
//    [self fun10];
    
//    [self fun11];
    
//    [self fun12];
    
//    [self fun13];
    
//    [self fun14];
    
//    [self fun15];
    
//    [self fun16];
    
//    [self fun17];
    
//    [self fun18];
    
//    [self fun19];
    
//    [self fun20];
    
    [self fun21];
    
}

- (void)fun21 {
    // string to char
    
    NSString *s1 = @"rrrrurrrrrrrrrwbbbbbbbbbH";
    char c1[s1.length];
    
    snprintf(c1, s1.length+1, "%s", s1.UTF8String);
    
    
    
    char *c2 = strchr(c1, 'w');
    
    NSLog(@"sylar :  c2 = %s", c2);
    
    char ww = 'w';
    
    
    size_t t1 = strcspn(c1, &ww);
    NSLog(@"sylar :  t1 = %zu", t1);
    
    c1[15] = 'k';
    
    
    
    NSLog(@"sylar :  end = %s", c1);
    
    
}

- (void)fun20
{
    // 小数位数
    CGFloat f1 = 1.234567;
    NSInteger bit = 4;
    NSString *s1 = [NSString stringWithFormat:@"%%.%ldf", bit];
    NSString *s2 = [NSString stringWithFormat:s1, f1];
    
    NSLog(@"s1 = %@, s2 = %@", s1, s2);
}

- (void)fun19
{
    // replace string
    NSString *s1 = @"a123bcd123aaaa123bbbb123";
    NSString *s2 = [s1 stringByReplacingOccurrencesOfString:@"123" withString:@"456"];
    NSLog(@"s2 = %@", s2);
    
    s2 = [s1 stringByReplacingOccurrencesOfString:@"123" withString:@"H" options:NSBackwardsSearch|NSAnchoredSearch range:NSMakeRange(0, s1.length)];
    NSLog(@"s2 = %@", s2);
}

- (void)fun18
{
    // append nil string
    NSString *s1 = nil;
    NSString *s2 = [s1 stringByAppendingString:@"124"];
    NSLog(@"s2 = %@", s2);
    
    s2 = @"abc";
    NSString *s3 = [s2 stringByAppendingString:s1];  // crash
    NSLog(@"s3 = %@", s3);
    s3 = [s3 stringByAppendingString:@"uuu"];
    NSLog(@"s3 = %@", s3);
}

- (void)fun17
{
    // 分割 componentsSeparatedByString
    NSString *s1 = @"ab111cd111efg";
    NSArray *aa = [s1 componentsSeparatedByString:@"11"];
    NSLog(@"aa = %@", aa);
    
    s1 = @"ab1111cd1111efg";
    aa = [s1 componentsSeparatedByString:@"11"];
    NSLog(@"aa = %@", aa);
    
    s1 = @"ab11111cd11111efg";
    aa = [s1 componentsSeparatedByString:@"11"];
    NSLog(@"aa = %@", aa);
    
    s1 = @"abc";
    aa = [s1 componentsSeparatedByString:@""];
    NSLog(@"aa = %@", aa);
    
    s1 = @"abc";
    NSString *s2 = [s1 stringByReplacingOccurrencesOfString:@"" withString:@"HH"];
    NSLog(@"s2 = %@", s2);
    
}

- (void)fun16
{
    // compare string
    NSString *s1 = @"9";
    NSString *s2 = @"5";
    
    NSComparisonResult rr = [s1 compare:s2];
    NSLog(@"result(%@, %@) = %ld", s1, s2, rr);  // 1
    
    s1 = @"15";
    s2 = @"4";
    rr = [s1 compare:s2];
    NSLog(@"result(%@, %@) = %ld", s1, s2, rr);  // -1
    
    s1 = @"8.1.3";
    s2 = @"8.0.5";
    rr = [s1 compare:s2];
    NSLog(@"result(%@, %@) = %ld", s1, s2, rr);  // 1
    
    
    s1 = @"8";
    s2 = @"7.9.5";
    rr = [s1 compare:s2];
    NSLog(@"result(%@, %@) = %ld", s1, s2, rr);  // 1
    
}


- (void)fun15
{
    NSString *aa = [NSString stringWithFormat:@"a = %2zd", 4];
    NSLog(@"aa = %@", aa);
    
    NSInteger a1 = -5;
    aa = [NSString stringWithFormat:@"a = %3zd", a1];
    NSLog(@"aa = %@", aa);

}

- (void)fun14
{
    const char *cc = "abcd";
    cc = NULL;  // NULL 会crash
    NSString *ss = [NSString stringWithUTF8String:cc];
    NSLog(@"ss = %@", ss);
}

- (void)fun13
{
    // isequal
    
    NSString *s1 = @"abc";
    NSString *s2 = @"0abc";
    
    s2 = [s2 substringFromIndex:1];
    
    [self fun13Compare:s1 anotherObject:s2 comment:@"string"];
    
    
    
    UIButton *btn1 = [[UIButton alloc] init];
    UIButton *btn2 = [[UIButton alloc] init];
    
    [self fun13Compare:btn1 anotherObject:btn2 comment:@"button"];
    
    
    NSNull *n1 = [NSNull null];
    NSNull *n2 = [NSNull null];
    
    [self fun13Compare:n1 anotherObject:n2 comment:@"null"];
    
    NSData *d1 = [s1 dataUsingEncoding:NSUTF8StringEncoding];
    NSData *d2 = [s1 dataUsingEncoding:NSUTF8StringEncoding];
    
    [self fun13Compare:d1 anotherObject:d2 comment:@"data"];
    
    
}

- (void)fun13Compare:(id)obj1 anotherObject:(id)obj2 comment:(NSString *)comment
{
    NSLog(@"comment = %@ ----------", comment);
    if (obj1 == obj2)
    {
        NSLog(@"==");
    }
    
    if ([obj1 isEqual:obj2])
    {
        NSLog(@"equal");
    }
}



- (void)fun12
{
    NSString *aa = @"abc9999999abcd999999abcde99999";
    NSRange r1 = [aa rangeOfString:@"abc"];
    NSLog(@"r1 = %ld, %ld", r1.location, r1.length);
    
    
    
    
    
}

- (void)fun11
{
    StringArrayObj1 *oo = [[StringArrayObj1 alloc] init];
    
    // string
    NSString *s1 = @"s1";
    NSString *s2 = @"s2";
    
    
    oo.p1 = s1;
    oo.p2 = s2;
    
    NSLog(@"s1 = %@", [s1 description]);
    
    
    s1 = @"s1111";
    
    s2 = @"s2222";
    
    NSLog(@"oo = %@", oo);
    
    // mutable string
    NSMutableString *m1 = [[NSMutableString alloc] initWithString:@"m1"];
    NSMutableString *m2 = [[NSMutableString alloc] initWithString:@"m2"];
    
    oo.p3 = m1;
    oo.p4 = m2;
    
    NSLog(@"");
    
    [m1 appendString:@" append m1"];
    [m2 appendString:@" append m2"];
    
    NSLog(@"oo = %@", oo);
    
    
    // array
    NSArray *a1 = @[@"1", @"2"];
    NSArray *a2 = @[@"a", @"b"];
    
    oo.a1 = a1;
    oo.a2 = a2;
    
    NSLog(@"");
    
    a1 = @[@"1", @"2", @"3"];
    a2 = @[@"a", @"b", @"c"];
    
    NSLog(@"oo = %@", oo);
    
    // mutable array
    NSMutableArray *a3 = [[NSMutableArray alloc] initWithArray:a1];
    NSMutableArray *a4 = [[NSMutableArray alloc] initWithArray:a2];
    
    oo.a3 = a3;
    oo.a4 = a4;
    
    NSLog(@"");
    
    [a3 addObject:@"44"];
    [a4 addObject:@"dd"];
    
    NSLog(@"oo = %@", oo);
    
    // block
    StringArrayObj1Block block1 = ^(NSString *data){
        NSLog(@"b111 = %@", data);
    };
    
    StringArrayObj1Block block2 = ^(NSString *data){
        NSLog(@"b222 = %@", data);
    };
    
    oo.b1 = block1;
    oo.b2 = block2;
    
    NSLog(@"");
    
    block1 = ^(NSString *data){
        NSLog(@"b111 ag = %@", data);
    };
    
    block2 = ^(NSString *data){
        NSLog(@"b222 ag = %@", data);
    };
    
    NSLog(@"oo = %@", oo);
    
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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
#pragma clang diagnostic ignored "-Wconstant-conversion"
- (void)fun4
{
    CGFloat f1 = 123456789012345678.12345;
    NSLog(@"f1 = %f", f1);
    int n1 = 12345678901234;

    NSLog(@"n1 = %d", n1);
    
}
#pragma clang diagnostic pop



@end

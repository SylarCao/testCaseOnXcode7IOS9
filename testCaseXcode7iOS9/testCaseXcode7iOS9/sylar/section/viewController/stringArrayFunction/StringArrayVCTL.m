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
#import "StringArrayObject1.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
# define kAAA @"abc"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface StringArrayVCTL ()

@property (nonatomic, strong) NSString *s1;
@property (nonatomic, weak) NSString *w1;
@property (nonatomic, copy) NSString *c1;
@property (nonatomic) NSString *s0;

@property (nonatomic, strong) UIColor *ss1;
@property (nonatomic, weak) UIColor *ww1;
@property (nonatomic, copy) UIColor *cc1;

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
    
//    [self fun21];
    
//    [self fun22];
    
//    [self fun23];
    
//    [self fun24];
    
//    [self fun25];
    
//    [self fun26];
    
//    [self fun27];
    
//    [self fun28];
    
//    [self fun29];
    
//    [self fun30];
    
//    [self fun31];
    
//    [self fun32];
    
//    [self fun33];
    
//    [self fun34];
    
//    [self fun35];
    
//    [self fun36];
    
//    [self fun37];
    
//    [self fun38];
    
//    [self fun39];
    
//    [self fun40];
    
//    [self fun41];
    
//    [self fun42];
    
//    [self fun43];
    
    [self fun44];
}

- (void)fun44 {
    NSUInteger a1 = 5;
    NSUInteger a2 = 7;
    
    NSUInteger a3 = 20;
    NSInteger a4 = MIN(a3, a1 - a2);
    NSLog(@"sylar : a4 = %lu", a4);
}

- (void)fun43 {
    CGFloat width = 375-110;
    NSInteger font_size = 16;
    UILabel *ll = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, width, 200)];
    ll.font = [UIFont systemFontOfSize:font_size];
    ll.textColor = [UIColor blackColor];
    [self.view addSubview:ll];
    ll.layer.borderColor = [UIColor redColor].CGColor;
    ll.layer.borderWidth = 1;
    ll.numberOfLines = 0;
    
    NSString *s1 = @"恩华药业(sz002262)两日大跌近两成 300多名分析师参会讨论带量采购";
    CGRect rr = [s1 boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font_size]} context:nil];
    NSLog(@"sylar : rr = %f", rr.size.height);
    
//    s1 = @"恩华药业两日大跌近两成 300多名分析师参会讨论带量采购";
//    rr = [s1 boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font_size]} context:nil];
//    NSLog(@"sylar : rr = %f", rr.size.height);
    
    s1 = @"富易测试恩华药业(sz002262)两日大跌近两成 300多名分析师参会讨论带量采购";
    rr = [s1 boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font_size]} context:nil];
    NSLog(@"sylar : rr = %f", rr.size.height);
    
    
    ll.text = s1;
    
}

- (void)fun42 {
//    CGPoint pp[5];
//    pp[0] = CGPointMake(1, 1);
//    pp[1] = CGPointMake(10, 11);
//    pp[2] = CGPointMake(100, 12);
    
    float pp[5];
    pp[0] = 2;
    pp[2] = 5;
    pp[3] = 8;
    
    
    [self fun42Helper:pp];
}

- (void)fun42Helper:(float *)pp {
    int a1 = sizeof(pp);
    int a2 = sizeof(pp[0]);
    NSLog(@"sylar : a1 = %d - %d", a1, a2);
}

// max min
- (void)fun41 {
    int a = 1;
    int b = 5;
    unsigned int c = 7;
//    int c = 7;
    int d = MIN(9, a - c);
    NSLog(@"sylar : aaa");
}

// NSUInteger NSInteger
- (void)fun40 {
    NSUInteger a1 = 18446744073709551605;
    NSInteger a2 = a1;
    NSLog(@"sylar : %lu, %ld", (unsigned long)a1, a2);
}

// compare string
- (void)fun39 {
    NSString *s1 = @"a";
    NSString *s2 = @"b";
    NSString *s3 = @"2";
    NSString *s4 = @"5";
    NSString *s5 = @"21";
    NSString *s6 = @"aa";
    NSString *s7 = @"ba";
    NSString *s8 = @"bc";
    
    NSComparisonResult rr = [s1 compare:s2];
    NSLog(@"sylar :  compare %@, %@ = %ld",s1, s2, rr);
    
    rr = [s3 compare:s4];
    NSLog(@"sylar :  compare %@, %@ = %ld",s3, s4, rr);
    
    rr = [s4 compare:s5];
    NSLog(@"sylar :  compare %@, %@ = %ld",s4, s5, rr);
    
    rr = [s1 compare:s6];
    NSLog(@"sylar :  compare %@, %@ = %ld",s1, s6, rr);
    
    rr = [s7 compare:s8];
    NSLog(@"sylar :  compare %@, %@ = %ld",s7, s8, rr);
    
}

- (void)fun38 {
    NSMutableArray *a1 = @[@"1", @"2", @"3", @"4"].mutableCopy;
    [a1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *s1 = obj;
        NSLog(@"sylar :  s = %@ - %ld - (%@)", s1, idx, a1);
        if (idx == 2) {
            [a1 addObject:@"10"];  // ok
        }
    }];
    // output = 1 2 3 4 1
    
    for (int i=0; i<a1.count; i++) {
        NSString *s1 = [a1 objectAtIndex:i];
        NSLog(@"sylar :  s = %@", s1);
        if ([s1 isEqualToString:@"2"]) {
            [a1 addObject:@"20"];  // crash
        }
    }
    // output = 1 2 3 4 10 20
    
    for (NSString *s1 in a1 ) {
        NSLog(@"sylar :  s = %@", s1);
        if ([s1 isEqualToString:@"2"]) {
            [a1 addObject:@"30"];  // crash
        }
    }
}

- (void)fun37 {
    NSArray *aa = @[];
    id a1 = [aa lastObject];
    id a2 = [aa firstObject];
    
    NSLog(@"sylar :  aaa = %@ - %@", a1, a2);  // nil, nil
    
    
    NSArray *bb = nil;
    id b1 = bb.firstObject;
    NSLog(@"sylar :  bbb = %@ - %@", bb, b1);  // nil, nil
}

- (void)fun36 {
    
    //    NSInteger -> zd
    //    NSUInteger -> tu
    
    NSString *s1 = [NSString stringWithFormat:@"aaa = %zd", -1];
    NSLog(@"sylar :  s1 = %@", s1);
    
    int a1 = -1;
    s1 = [NSString stringWithFormat:@"%zd", a1];
    NSLog(@"sylar :  s1 = %@", s1);
    
    NSInteger a11 = [s1 integerValue];
    NSLog(@"sylar :  a11 = %ld", a11);
    
    NSInteger a2 = -1;
    s1 = [NSString stringWithFormat:@"%zd", a2];
    NSLog(@"sylar :  s1 = %@", s1);
    
    NSInteger a3 = [s1 integerValue];
    NSLog(@"sylar :  a2 = %ld", a3);
    
    int a4 = -1;
    s1 = [NSString stringWithFormat:@"%d", a4];
    NSLog(@"sylar :  s1 = %@", s1);
    
    NSInteger a5 = [s1 integerValue];
    NSLog(@"sylar :  a5 = %ld", a5);
    
}

- (void)fun35 {
    // reference link: https://mp.weixin.qq.com/s?__biz=MjM5NTIyNTUyMQ==&mid=2709545396&idx=1&sn=e4faf102653f2bf769945234ad6d7a6a&chksm=828f0b6ab5f8827c7d9b4b624d4e252853ad86c65710a0aa606f212b4c406ec3ef3cc0b3a8bd&mpshare=1&scene=1&srcid=06270e4GCqCX4PGO4UfEYkaM&key=8e7349a2eeff6e43d3ef492cbaebaab91e8c13f9e7c87a83a346e6c1870c37669ebfd967f52a3669a1cd38f4723f6acb94030f6c91862d77786c370d80d6204051d2e255e79a32beeaea69d8ebcebd4b&ascene=0&uin=MTQ2OTIyMzg2Mg%3D%3D&devicetype=iMac+Macmini7%2C1+OSX+OSX+10.12+build(16A323)&version=12020510&nettype=WIFI&fontScale=100&pass_ticket=ElJ7LOYzu2xKPCz1O3FMwfYeUiGtcuYbiukKFwAb9ttjUanHwljLpPLUi8x%2FWXnH
    NSDictionary *dict = @{@"1": @"111", @"2": @"222", @"3": @"333", @"4": @"444", @"5": @"555", @"6": @"666"};
    StringArrayObject1 *obj = [[StringArrayObject1 alloc] init];
    NSError *ee = nil;
    BOOL bb = [self fun35Helper1:dict obj:obj error:&ee];
    NSLog(@"sylar :  bb = %d (%@)", bb, ee);
}

- (BOOL)fun35Helper1:(NSDictionary *)dict obj:(StringArrayObject1 *)obj1 error:(NSError __strong**)error {
    __block BOOL rt = YES;
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj1 checkValue:obj key:key])
            return;
        
        NSLog(@"sylar :  here (%@)", *error);
        *stop = YES;
        rt = NO;
        if (error) {
            *error = [NSError errorWithDomain:@"ddd" code:111 userInfo:nil];  // this will crash
            // 因为这个枚举里是个 @autoreleasepool
        }
    }];
    
//    __block NSError *e1 = nil;
//    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        if ([obj1 checkValue:obj key:key])
//            return;
//        
//        NSLog(@"sylar :  here (%@)", *error);
//        *stop = YES;
//        rt = NO;
//        if (error) {
//            e1 = [NSError errorWithDomain:@"ddd" code:111 userInfo:nil];  // 入参写成  error:(NSError __strong**)error  也行
//        }
//    }];
//    *error = e1;
    
    return rt;
}

- (void)fun34 {
    NSArray *aa = @[@"1", @"2"];
    NSString *obj = @"123";
    
    NSInteger index = [aa indexOfObject:obj];
    if (index == NSNotFound) {
        NSLog(@"sylar :  aaaa index not found");  // here
    } else {
        NSLog(@"sylar :  aaaaaaa");
    }
    
    aa = nil;
    index = [aa indexOfObject:obj];
    if (index == NSNotFound) {
        NSLog(@"sylar :  bbbbb index not found");
    } else {
        NSLog(@"sylar :  bbbbb");   // here
    }
    
}

- (void)fun33 {
    NSArray *aa = [[NSArray alloc] init];
    
    NSLog(@"sylar :  aaa = %ld, %lu", aa.count, aa.count-1);
    
    for (int i=0; i<(NSInteger)aa.count-1; i++) {
        NSString *ss = [aa objectAtIndex:i];
    }
}

- (void)fun32 {
    NSString *s1 = @"123";
    NSString *k = @"kk";
    s1 = nil;
    
//    NSDictionary *dict1 = @{k : s1};  // nil crash
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"obj1", @"k1", s1, k, nil];  // nil not crash
    NSDictionary *dict3 = [NSDictionary dictionaryWithObject:s1 forKey:k];  // nil crash
    
    NSLog(@"sylar :  info");
}

- (void)fun31 {
    NSMutableString *s1 = [[NSMutableString alloc] initWithString:@"12345"];
    self.s1 = s1;
    self.c1 = s1;
    self.s0 = s1;
    
    [s1 appendString:@"aaaa"];
    
    NSLog(@"sylar :  %@(%p), %@(%p), %@(%p)", s1, s1, self.s1, self.s1, self.c1, self.c1);
    
    NSLog(@"sylar :  mutable = %d", [self.c1 isKindOfClass:[NSMutableString class]]);
    
    NSLog(@"sylar :  s0 = %@", self.s0);  //  s0 = 12345aaaa
    
    
    s1 = [[NSMutableString alloc] initWithString:@"12345"];
    NSString *s2 = s1;
    [s1 appendString:@"aaaa"];
    
    NSLog(@"sylar :  s1 = %@, s2 = %@", s1, s2);   // s1 = 12345aaaa, s2 = 12345aaaa
    
}

- (void)fun30 {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i=0; i<10; i++) {
        NSString *ss = [NSString stringWithFormat:@"a = %d", i];
        [arr addObject:ss];
    }
    
    
//    NSArray *a1 = [[NSArray alloc] initWithArray:arr];
//    [a1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"sylar :  obj = %@, index(%ld), stop(%d)", obj, idx, *stop);
//        if (idx == 4) {
//            *stop = YES;
//        }
//    }];
    
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"sylar :  obj = %@, index(%ld), stop(%d)", obj, idx, *stop);
        if (idx == 4) {
            [arr removeObject:obj];
        }
    }];    // not crash  
    
    
    
}

- (void)fun29 {
    NSString *s1 = @"aa";   // NSCFConstantString
    NSString *s2 = [s1 copy];  // NSCFConstantString
    NSString *s3 = [s1 mutableCopy];  // NSCFString
    NSString *s4 = [[s1 mutableCopy] copy];  // NSTaggedPointerString
    
    self.s1 = s4;
    self.w1 = s4;
    self.c1 = s4;
    NSLog(@"sylar :  s1 = %p, %p, %p, %p, s1(%p), %p, %p ", s1, s2, s3, s4, self.s1, self.w1, self.c1);  // s1=s2, s3, s4=_s1=_w1=_c1
    
//    s1 = @"s222";
//    NSLog(@"sylar :  s1 = %@", s1);
//    NSLog(@"sylar :  s1 = %p, %p, %p, %p, s1(%p), %p, %p ", s1, s2, s3, s4, self.s1, self.w1, self.c1);  //
    
    
    NSString *s5 = s4;  // NSTaggedPointerString (same address as s4)
    s5 = @"bb";         // NSCFConstantString
    s5 = @"aa";         // NSCFConstantString    3个s5地址都不一样
    
    NSLog(@"sylar :  s5 = %@", s5);
    
    
}

- (void)fun28 {
    NSString *s1 = @"123";
    NSLog(@"sylar :  s1 = %p", s1);   // address1
    s1 = @"234";
    NSLog(@"sylar :  s1 = %p", s1);   // address2
    s1 = @"123";
    NSLog(@"sylar :  s1 = %p", s1);   // address1
    s1 = @"123";
    NSLog(@"sylar :  s1 = %p", s1);   // address1
}

- (void)fun27 {
    _ss1 = [UIColor redColor];
    _ww1 = _ss1;
    _ss1 = [UIColor blueColor];
    
    NSLog(@"sylar :   %@(%p) %@(%p)", _ss1, _ss1, _ww1, _ww1);  // 4个都一样
}

- (void)fun26 {
    // strong weak copy
    UIColor *cc = [UIColor redColor];
    _ss1 = cc;
    _ww1 = cc;
    _cc1 = cc;
    NSLog(@"sylar :  %@(%p) %@(%p) %@(%p) %@(%p)", _ss1, _ss1, _ww1, _ww1, _cc1, _cc1, cc, cc);  // 4个都一样
    
    cc = [UIColor yellowColor];
    NSLog(@"sylar :  %@(%p) %@(%p) %@(%p) %@(%p)", _ss1, _ss1, _ww1, _ww1, _cc1, _cc1, cc, cc);  // ss 不一样，其他3个一样
    
    _ss1 = [UIColor yellowColor];
    _cc1 = [UIColor blueColor];
    NSLog(@"sylar :  %@(%p) %@(%p) %@(%p) %@(%p)", _ss1, _ss1, _ww1, _ww1, _cc1, _cc1, cc, cc);  // 4个都不一样
}

- (void)fun25 {
    // strong weak copy
    NSString *ss = @"00";
    _s1 = ss;
    _w1 = ss;
    _c1 = ss;
    NSLog(@"sylar :  %@(%p) %@(%p) %@(%p) %@(%p)", _s1, _s1, _w1, _w1, _c1, _c1, ss, ss);  // 4个都一样
    
    ss = @"123";
    NSLog(@"sylar :  %@(%p) %@(%p) %@(%p) %@(%p)", _s1, _s1, _w1, _w1, _c1, _c1, ss, ss);  // ss 不一样，其他3个一样
    
    _s1 = @"s1";
    _c1 = @"c1";
    NSLog(@"sylar :  %@(%p) %@(%p) %@(%p) %@(%p)", _s1, _s1, _w1, _w1, _c1, _c1, ss, ss);  // 4个都不一样
}

- (void)fun24 {
    NSInteger a1 = 123401;
    NSString *s1 = [NSString stringWithFormat:@"%.2f HH", a1/1000.f];
    NSLog(@"sylar :  s1 = %@", s1);   // 123.40
    
    a1 = 123409;
    s1 = [NSString stringWithFormat:@"%.2f HH", a1/1000.f];
    NSLog(@"sylar :  s1 = %@", s1);   // 123.41
}

- (void)fun23 {
    // NSDictionaryOfVariableBindings这个宏生成一个字典,这个宏可以生成一个变量名到变量值映射的Dictionary,比如:
    NSNumber * packId=@(2);
    NSNumber *userId=@(22);
    NSNumber *proxyType=@(2);
    NSDictionary *param=NSDictionaryOfVariableBindings(packId,userId,proxyType);
    NSLog(@"sylar :  param = %@", param);
}

- (void)fun22 {
    NSInteger a = 15;
    NSInteger b = 3;
    NSInteger c = 0;
    CGFloat d = 0;
    
    CGSize size = CGSizeMake(10, 0);
    
    CGFloat a1 = a/b;
    CGFloat a2 = b/size.height;
    CGFloat a3 = b/d;  // not crash
    CGFloat a4 = b/c;  // crash
    
    NSLog(@"sylar :  f = %f, %f, %f", a1, a2, a3);
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

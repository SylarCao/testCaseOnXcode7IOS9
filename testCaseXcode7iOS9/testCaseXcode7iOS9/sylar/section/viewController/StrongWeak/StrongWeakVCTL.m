//
//  StrongWeakVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/2/17.
//  Copyright © 2017年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "StrongWeakVCTL.h"
#import "StrongWeakObject.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface StrongWeakVCTL ()

@property (nonatomic, weak) NSMutableArray *array1;
@property (nonatomic, weak) NSString *ws1;
@property (nonatomic, weak) UIColor *wc1;
@property (nonatomic, strong) NSString *ss2;
@property (nonatomic, copy) NSString *cs3;

@property (nonatomic, strong) StrongWeakObject *obj1;
@property (nonatomic, strong) StrongWeakObject *obj2;

@property (nonatomic, strong) NSArray *arr1;
@property (nonatomic, copy) NSArray *arr2;

@property (nonatomic, strong) NSMutableArray *marr1;
@property (nonatomic, copy) NSMutableArray *marr2;


@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation StrongWeakVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _array1 = [[NSMutableArray alloc] initWithObjects:@"a", @"b", @"c", nil];
    _array1 = [NSMutableArray arrayWithObjects:@"a", @"b", @"c", nil];
    _ws1 = @"my s1";
    _wc1 = [UIColor whiteColor];
    
//    [self fun1];
    
//    [self fun2];
    
//    [self fun3];
    
//    [self fun4];
    
//    [self fun5];
    
//    [self fun6];
    
//    [self fun7];
    
//    [self fun8];
    
//    [self fun9];
    
    [self fun10];

}

- (void)fun10 {
    NSString *s1 = @"abcd";
    NSString *s2 = @"abcd";
    
    NSLog(@"sylar :  s1 = %p, %p", s1, s2);  // same
    
    s2 = @"cc";
    s2 = @"abcd";
    NSLog(@"sylar :  s2 = %p, %p", s1, s2);  // same
    
    s2 = [NSString stringWithFormat:@"%@", s1];
    NSLog(@"sylar :  s3 = %p, %p", s1, s2);  // not same
    
    s2 = @"abcd";
    NSLog(@"sylar :  s4 = %p, %p", s1, s2);  // same
    
    s2 = [self fun10Helper];
    NSLog(@"sylar :  s5 = %p, %p", s1, s2);  // same
    
    NSString *ss1 = @"111bacd";
    NSString *ss2 = @"abcd111";
    s1 = [ss1 substringFromIndex:3];
    s2 = [ss2 substringToIndex:4];
    NSLog(@"sylar :  s5 = %@(%p), %@(%p)", s1, s1, s2, s2);  // not same address
    
    NSArray *aa = @[s1, @"1", @"2", @"3"];
    if ([aa containsObject:s1]) {
        NSLog(@"sylar :  contain s1");  // work
    }
    
    if ([aa containsObject:s2]) {
        NSLog(@"sylar :  contain s2");  // not work
    }
    
    if ([aa containsObject:@"abcd"]) {
        NSLog(@"sylar :  contain abcd");  // not work
    }
    
    
    
}

- (NSString *)fun10Helper {
    NSString *rt = @"abcd";
    return rt;
}

- (void)fun9 {
    NSString *s1 = @"aaaaa";
    self.ss2 = s1;
    self.ws1 = s1;
    self.cs3 = s1;
    
    NSLog(@"sylar :  s1 = %@(%p), %@(%p), %@(%p), %@(%p),", s1, s1, self.ss2, self.ss2, self.ws1, self.ws1, self.cs3, self.cs3);
    
    self.cs3 = [s1 copy];
    NSLog(@"sylar :  s1 = %@(%p), %@(%p), %@(%p), %@(%p),", s1, s1, self.ss2, self.ss2, self.ws1, self.ws1, self.cs3, self.cs3);
    
    s1 = @"bbbb";
    NSLog(@"sylar :  s1 = %@(%p), %@(%p), %@(%p), %@(%p),", s1, s1, self.ss2, self.ss2, self.ws1, self.ws1, self.cs3, self.cs3);
    
    self.ss2 = @"cccc";
    NSLog(@"sylar :  s1 = %@(%p), %@(%p), %@(%p), %@(%p),", s1, s1, self.ss2, self.ss2, self.ws1, self.ws1, self.cs3, self.cs3);
    
    self.cs3 = @"ddd";
    NSLog(@"sylar :  s1 = %@(%p), %@(%p), %@(%p), %@(%p),", s1, s1, self.ss2, self.ss2, self.ws1, self.ws1, self.cs3, self.cs3);
}

- (void)fun8 {
    
//    [self testA:@"aabcad"];
    
    self.marr2 = [[NSMutableArray alloc] init];
    if ([self.marr2 isKindOfClass:[NSMutableArray class]]) {
        NSLog(@"sylar :  arr2  yes");
    } else {
        NSLog(@"sylar :  arr2 no");
    }
    
    [self.marr2 addObject:@"1"];
    
}

- (void)testA:(NSString *)str {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i=0; i<str.length; i++) {
        [arr addObject:[str substringWithRange:NSMakeRange(i, 1)]];
    }
    
    NSLog(@"sylar :  arr = %@", arr);
    
    
    int count = arr.count;
    for (int j=0; j<count; j++) {
        for (int i=j; i<count; i ++) {
            [arr objectAtIndex:i+2];
            NSString *a = [arr objectAtIndex:j];
            NSString *b = [arr objectAtIndex:i+2];
            if ([a isEqualToString:b]) {
                [arr replaceObjectAtIndex:i+2 withObject:@""];
            }
        }
    }
    NSLog(@"sylar :  arr = %@", arr);
    
}

- (IBAction)btn1:(id)sender {
    NSLog(@"sylar :  btn1");
    
//    [self fun1];
}

- (void)fun7 {
    UIColor *c1 = [UIColor colorWithRed:0.5 green:0.6 blue:0.7 alpha:1];
    
    NSLog(@"sylar :  c1 = %p", c1);  //  输出地址
//    c1.
}

- (void)fun6 {
    StrongWeakObject *obj1 = [[StrongWeakObject alloc] init];
    obj1.value = 1;
    
    self.marr2 = [[NSMutableArray alloc] init];
    
    NSArray *a0 = @[@"1", @"2", @"3"];
    NSMutableArray *a1 = [[NSMutableArray alloc] initWithObjects:@"1", @"2", obj1, @"3", nil];
    self.marr1 = a1;   // arrayM
    self.marr2 = a1;   // array
    
    obj1.value = 2;
    
    NSLog(@"sylar :  mmm = %d", [self.marr2 isKindOfClass:[NSMutableArray class]]);
    
    [a1 addObject:@"5"];
    
    NSLog(@"sylar :  a1 = %p, %p, %p", a1, self.marr1, self.marr2);
    
    self.marr2 = [a1 mutableCopy];  // array
    NSLog(@"sylar :  mmm = %d", [self.marr2 isKindOfClass:[NSMutableArray class]]);  // 0
    NSLog(@"sylar :  a1 = %p, %p, %p", a1, self.marr1, self.marr2);
    
    self.marr2 = [[NSMutableArray alloc] initWithArray:a1];  // array
    NSLog(@"sylar :  mmm = %d", [self.marr2 isKindOfClass:[NSMutableArray class]]);  // 0
    NSLog(@"sylar :  a1 = %p, %p, %p", a1, self.marr1, self.marr2);
    
    self.marr2 = [a1 copy];
    NSLog(@"sylar :  mmm = %d", [self.marr2 isKindOfClass:[NSMutableArray class]]);  // 0
    NSLog(@"sylar :  a1 = %p, %p, %p", a1, self.marr1, self.marr2);
}

- (void)fun5 {
    
    StrongWeakObject *obj1 = [[StrongWeakObject alloc] init];
    obj1.value = 1;
    
    NSArray *a1 = @[@"1", @"2", @"4", obj1];
    self.arr1 = a1;
    self.arr2 = a1;
    
    obj1.value = 2;
    
    NSLog(@"sylar :  a1 = %@, %p, %p, %p", a1, a1, self.arr1, self.arr2);
    
}

- (void)fun4 {
    NSString *s1 = @"s1111";   // NSCFConstantString
    NSString *s2 = [s1 copy];  // NSCFConstantString
    NSString *s3 = [s1 mutableCopy];  // NSCFString
    NSString *s4 = [[s1 mutableCopy] copy];  // NSTaggedPointerString
    
    self.ws1 = s1;
    self.ss2 = s1;
    self.cs3 = s1;
    NSLog(@"sylar :  s1 = %@", s1);  // 3个地址都一样
    
    s1 = @"s222";
    NSLog(@"sylar :  s1 = %@", s1);
}

- (void)fun1 {
    UIColor *c1 = [UIColor redColor];
    _obj1 = [[StrongWeakObject alloc] init];
    _obj1.color = c1;
    c1 = [UIColor blueColor];
    _obj2 = [[StrongWeakObject alloc] init];
    _obj2.color = c1;
    c1 = [UIColor yellowColor];
    
    // obj1.color = red
    // obj2.color = blue
}

- (void)fun2 {
    UIColor *c1 = [UIColor redColor];
    _obj1 = [[StrongWeakObject alloc] init];
    _obj1.colorWeak = c1;
    c1 = [UIColor blueColor];
    _obj2 = [[StrongWeakObject alloc] init];
    _obj2.color = c1;
    c1 = [UIColor yellowColor];
    
    // obj1.weakColor = red
    // obj2.color = blue
}

- (void)fun3 {
    UIColor *c1 = [UIColor redColor];
    _obj1 = [[StrongWeakObject alloc] init];
    _obj1.color = c1;
    c1 = [UIColor blueColor];
    _obj2 = [[StrongWeakObject alloc] init];
    _obj2.colorWeak = _obj1.color;
    c1 = [UIColor yellowColor];
    _obj1.color = [UIColor greenColor];
    
    // obj1.color = green
    // obj2.weakColor = red
}

@end

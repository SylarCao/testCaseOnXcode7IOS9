//
//  TestBlockVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/8.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TestBlockVCTL.h"
#import "BlockObject1.h"
#import "BlockObject2.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
#define normalize( x )    try{} @finally{} __typeof__(x) x = __weak_##x##__;
#define weakify( x )    autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x;
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TestBlockVCTL ()
{
    NSString *member1;
}

@property (nonatomic, weak) BlockObject1BlockStrong strong;

@property (nonatomic, strong) BlockObject1BlockWeak weak;

@property (nonatomic, strong) BlockObject1 *obj;
@property (nonatomic, weak) BlockObject1 *objWeak;

@property (nonatomic, strong) NSString *string1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TestBlockVCTL

- (void)dealloc
{
    NSLog(@"dealloc TestBlockVCTL");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _string1 = @"init_value";
}

- (IBAction)btn2:(id)sender {
    NSLog(@"sylar :  222");
}

- (IBAction)btn1:(id)sender
{
//    [self fun1];
    
//    [self fun2];
    
//    [self fun3];
    
//    [self fun4];
    
//    [self fun6];
    
//    [self fun7];
    
//    [self funPara1];
    
//    [self funPara2];
    
//    [self funPara3];
    
    [self fun8];
    
}

- (void)fun8 {
    BlockObject1 *b1 = [[BlockObject1 alloc] init];
    _obj = b1;
    [b1 requestBlockStrong:^(NSString *data) {
        NSLog(@"sylar :  not release -- xun huan yin yong le");
        self.string1 = data;
    }];
    
    

}

- (void)fun7 {
    BlockObject1 *b1 = [[BlockObject1 alloc] init];
    _obj = b1;
    self.string1 = @"ssr";
    
    // 下边这样写 没问题
    __weak TestBlockVCTL *ww = self;
    [b1 requestBlockStrong:^(NSString *data) {
        NSLog(@"sylar :  back");
        NSLog(@"sylar :  self = %p", self.string1);   // not ok
        NSLog(@"sylar :  self = %p", _string1);       // not ok
        NSLog(@"sylar :  self = %p", ww.string1);     // ok
    }];
    
//    @weakify(self);
//    [b1 requestBlockStrong:^(NSString *data) {
//        @normalize(self);
//        NSLog(@"sylar :  back");
//        NSLog(@"sylar :  self = %p", self.string1);  // ok
//        NSLog(@"sylar :  self = %p", _string1);      // not ok
//        NSLog(@"sylar :  self = %p", self->member1);  // ok
//        NSLog(@"sylar :  self = %p", member1);       // not ok
//    }];
    
   
}

- (void)fun6 {
    BlockObject1 *ss = [[BlockObject1 alloc] init];
    _objWeak = ss;
    BlockObject1 *b1 = [[BlockObject1 alloc] init];
//    _obj = b1;
    [b1 requestBlockStrong:^(NSString *data) {
//        NSLog(@"sylar :  b1 = %@(%@)", b1, ss);
//        NSLog(@"sylar :  self = %p", self);
        
//        self.string1 = data;
//        NSLog(@"sylar :  back = %@", data);
    }];
}

- (void)fun5
{
    // __block 什么意思
    // reference link: http://stackoverflow.com/questions/7080927/what-does-the-block-keyword-mean
    
    NSInteger a1 = 42;
    __block NSInteger a2;
    
    void (^aBlock)(void) = ^(void) {
        a2 = 77;
        a2 = a1;
//        a1 = a2;   // 这个会报错
    };
    
    aBlock(); // execute the block
}

- (void)fun1
{
    BlockObject1 *block1 = [[BlockObject1 alloc] init];
    [block1 requestBlockStrong:^(NSString *data) {
        NSLog(@"ss = %@", data);
    }];
    _obj = block1;  // 会输出
}

- (void)fun2
{
    BlockObject1 *b1 = [[BlockObject1 alloc] init];
    [b1 requestBlockWeak:^(NSString *data) {
        NSLog(@"ww = %@", data);
        BlockObject2 *oo = [[BlockObject2 alloc] init];
        NSLog(@"sylar :  bbb");
    }];
    _obj = b1;  // 会输出

}

- (void)fun3
{
    BlockObject1BlockStrong block1 = ^(NSString *data){
        NSLog(@"s = %@", data);  // 不输出
    };
    _strong = block1;
    BlockObject1 *bb1 = [[BlockObject1 alloc] init];
    [bb1 requestBlockStrong:_strong];
}

- (void)fun4
{
    BlockObject1BlockWeak block1 = ^(NSString *data){
        NSLog(@"w = %@", data);    // 不输出
    };
    _weak = block1;
    BlockObject1 *bb1 = [[BlockObject1 alloc] init];
    [bb1 requestBlockWeak:_weak];
}

- (void)funPara1
{
    _string1 = @"another";
    BlockObject1 *obj1 = [[BlockObject1 alloc] init];
    NSString *ss = _string1;
    [obj1 requestBlockWithParameter:ss block:^(NSString *data) {
        NSLog(@"ss = %@", ss);
        NSLog(@"data = %@", data);
        NSLog(@"para1 = %@", _string1);  // 这里循环引用了
        
        BlockObject2 *oo = [[BlockObject2 alloc] init];
        oo.value1 = 123;
        
//        if ([_string1 isEqualToString:data])
//        {
//            NSLog(@"same");
//        }
//        else
//        {
//            NSLog(@"not same");
//        }
        
        self.obj = nil;  // 加了这句就不会循环引用了
        
    }];
    _obj = obj1;
    
    _string1 = @"another";
}

- (void)funPara2 {
    _string1 = @"another";
    BlockObject1 *obj1 = [[BlockObject1 alloc] init];
    NSString *ss = _string1;
    __weak TestBlockVCTL *ttt = self;
    [obj1 requestBlockWithParameter:ss block:^(NSString *data) {
        NSLog(@"ss = %@", ss);
        NSLog(@"data = %@", data);
        NSLog(@"para1 = %@", ttt.string1);
        
        BlockObject2 *oo = [[BlockObject2 alloc] init];
        oo.value1 = 123;
        
        //        if ([_string1 isEqualToString:data])
        //        {
        //            NSLog(@"same");
        //        }
        //        else
        //        {
        //            NSLog(@"not same");
        //        }
        
    }];
    _obj = obj1;
    
    _string1 = @"another";
}

- (void)funPara3 {
    BlockObject1 *obj1 = [[BlockObject1 alloc] init];
    [obj1 requestWithTimer:^(NSString *data) {
        NSLog(@"sylar :  %@", data);
        
        NSLog(@"para1 = %@", _string1);  // 这里 不会循环引用
    }];
}

@end

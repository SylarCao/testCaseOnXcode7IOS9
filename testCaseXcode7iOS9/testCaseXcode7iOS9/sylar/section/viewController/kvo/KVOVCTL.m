//
//  KVOVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/31.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "KVOVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
NSString * const keyKVO1 = @"self.content.text";
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface KVOVCTL ()

@property (nonatomic, strong) NSString *s1;

@property (nonatomic, weak) IBOutlet UILabel *content;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation KVOVCTL

- (void)dealloc
{
    NSLog(@"dealloc KVOVCTL");
    [self removeObserver:self forKeyPath:keyKVO1];  // 没有这个会crash
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setInitialValue];
}

- (void)setInitialValue
{
    _s1 = @"init s1";
    
    // keyPath必须传 self.s1   _s1没有用
    // 修改的时候必须用self.s1   _s1没有用  见btn1,btn2
//    [self addObserver:self forKeyPath:@"self.s1" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
//    [self addObserver:self forKeyPath:@"_s1" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    [self addObserver:self forKeyPath:keyKVO1 options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    self.s1 = @"desef";
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"obobob");
}

- (IBAction)btn1:(id)sender
{
    self.s1 = @"btn s1";
    _content.text = @"bbb1";
    NSLog(@"sylar :  address = %p", _content.text);  // 相同地址也会出发kvo
}

- (IBAction) btn2:(id)sender
{
    _s1 = @"btn s2";
    self.content.text = @"bbb2";
    
}


@end

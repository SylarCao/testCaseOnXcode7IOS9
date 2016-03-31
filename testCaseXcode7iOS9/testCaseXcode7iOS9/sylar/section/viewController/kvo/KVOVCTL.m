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
@interface KVOVCTL ()

@property (nonatomic, strong) NSString *s1;

@property (nonatomic, weak) IBOutlet UILabel *content;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation KVOVCTL

- (void)dealloc
{
    NSLog(@"dealloc KVOVCTL");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setInitialValue];
}

- (void)setInitialValue
{
    _s1 = @"init s1";
    
//    [_s1 addObserver:self forKeyPath:@"self.s1.value" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    [self addObserver:self forKeyPath:@"self.content.text" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    _s1 = @"desef";
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"obobob");
}

- (IBAction)btn1:(id)sender
{
    _s1 = @"btn s1";
    _content.text = @"bbb1";
}

- (IBAction) btn2:(id)sender
{
    _s1 = @"btn s2";
    _content.text = @"bbb2";
}


@end

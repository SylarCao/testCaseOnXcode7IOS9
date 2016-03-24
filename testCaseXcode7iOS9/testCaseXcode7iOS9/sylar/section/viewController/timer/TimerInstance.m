//
//  TimerInstance.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/24.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TimerInstance.h"
#import "TimerObject.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TimerInstance()

@property (nonatomic, weak) NSTimer *timer1;

@property (nonatomic, weak) TimerObject *timerOjbect1;

@property (nonatomic, strong) NSMutableDictionary *dict;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TimerInstance

+ (instancetype)share
{
    static TimerInstance *inst = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        inst = [[TimerInstance alloc] init];
    });
    return inst;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _dict = [[NSMutableDictionary alloc] init];
        
    }
    return self;
}

- (void)startTimer:(id)delegate selector:(SEL)selector content:(NSString *)content
{
    TimerObject *obj = [[TimerObject alloc] init];
    obj.delegate = delegate;
    obj.selector = selector;
    obj.name = content;
    _timerOjbect1 = obj;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerFunction:) userInfo:obj repeats:YES];
    [timer fire];
    _timer1 = timer;
//    [_dict removeObjectForKey:content];
    [[_dict objectForKey:content] invalidate];
    [_dict setObject:timer forKey:content];
    
}

- (void)reStartTimer:(id)delegate selector:(SEL)selector content:(NSString *)content
{
    if (_timer1)
    {
        [(TimerObject *)_timer1.userInfo setName:content];
        [_timer1 fire];
        NSLog(@"-------------");
    }
    else
    {
        [self startTimer:delegate selector:selector content:content];
    }
}

- (void)timerFunction:(NSTimer *)aTimer
{
    NSLog(@"timer");
//    UIKeyboardAnimationCurveUserInfoKey
    TimerObject *obj = aTimer.userInfo;
    NSLog(@"timer.name = %@", obj.name);
    if ([obj.delegate respondsToSelector:obj.selector])
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [obj.delegate performSelector:obj.selector withObject:obj.name];
#pragma clang diagnostic pop
    }
    else
    {
        [aTimer invalidate];
        aTimer = nil;
//        [_dict removeObjectForKey:obj.name];
        
        NSLog(@"_timer === invalid" );
    }
}

- (void)fun1
{
    NSLog(@"");
}

@end

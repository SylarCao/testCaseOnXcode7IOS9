//
//  ThreadMethod1.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/1/6.
//  Copyright © 2017年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ThreadMethod1.h"
#import "ThreadItem.h"
#import <pthread.h>
#include <sys/sysctl.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ThreadMethod1 ()

@property (nonatomic, strong) NSMutableArray *data;


@property (nonatomic, strong) NSMutableArray *threads;
@property (nonatomic, assign) NSInteger startNumber;
@property (nonatomic, assign) NSInteger endNumber;
@property (nonatomic, assign) BOOL running;
@property (nonatomic, assign) NSInteger threadNumber;

@property (nonatomic, assign) pthread_mutex_t threadLock;

@property (nonatomic, assign) NSInteger currentThreadNumber;

//@property (nonatomic, assign) int count;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ThreadMethod1

- (id)init {
    self = [super init];
    if (self) {
        
        _startNumber = 100;
        _endNumber = 150;
        // (100, 120) = 4340
        // (100, 110) = 2070
        
        // (100, 120) => 4thread=3.1sec, 2thread=4.2sec, 1thread=7.5sec
        
        // (100, 150) = @{4thread = 13.59sec  2thread = 17.25sec, 1thread=33sec}
        
        // (100, 200) = @{4thread = 62sec, 2thread = 80sec}
        
        _data = [[NSMutableArray alloc] init];
        
        _threadNumber = 2;
        
        NSLog(@"sylar :  max thread = %ld", [self maxThreadCount]);
        
        
        for (int i=_startNumber; i<_endNumber; i++) {
            ThreadItem *item = [[ThreadItem alloc] init];
            item.number = i;
            [_data addObject:item];
        }
        
        pthread_mutex_init(&_threadLock, NULL);

    }
    return self;
}


- (void)method1 {
    
    
//    [self noThread];
    
    
    [self useThread];
    
    
    id aa = nil;
    
    [aa count];
    
}

//- (NSInteger)count {
//    NSObject *rt = [[NSObject alloc] init];
//    return rt;
//}

- (void)useThread {
    
    _running = YES;
    
    _threads = [[NSMutableArray alloc] init];
    for (int i=0; i<_threadNumber; i++) {
        NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadMethod1) object:nil];
        thread.qualityOfService = NSQualityOfServiceUserInitiated;
        thread.name = [NSString stringWithFormat:@"%i", i];
        [_threads addObject:thread];
    }
    
    _currentThreadNumber = 0;
    
    for (NSThread *thread in _threads) {
        [thread start];
    }

}

- (void)cancelThread {
    for (NSThread *thread in _threads) {
        [thread cancel];
    }
}

- (void)threadMethod1 {
    CFAbsoluteTime t1 = CFAbsoluteTimeGetCurrent();
    _currentThreadNumber ++;
    
    while (_running) {
        @autoreleasepool {
            
            ThreadItem *itemNotDone = nil;
            pthread_mutex_lock(&_threadLock);
            for (ThreadItem *item in _data) {
                if (item.valid == NO && item.calculating == NO) {
                    itemNotDone = item;
                    itemNotDone.calculating = YES;
                    break;
                }
            }
            pthread_mutex_unlock(&_threadLock);
            
            if (itemNotDone == nil) {
                // finish
//                _running = NO;
                
//                NSLog(@"sylar :  current thread count = %ld", _currentThreadNumber);
                
                if (_currentThreadNumber == 1) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        CFAbsoluteTime t2 = CFAbsoluteTimeGetCurrent();
                        NSLog(@"sylar :  time(finish) = %f value = %ld", t2-t1, [self calculateSum]);
                        [self cancelThread];
                    });
                } else {
                    _currentThreadNumber --;
                }
                
                break;
            } else {
                // calculate
                
                NSInteger value = [self complexCalculateWithNumber:itemNotDone.number];
                itemNotDone.answer = value;
                itemNotDone.valid = YES;
                
                
            }
            
            
        }
    }
}

- (NSInteger)calculateSum {
    NSInteger sum = 0;
    for (ThreadItem *item in _data) {
        sum = sum + item.answer;
    }
    return sum;
}


- (void)noThread {
    CFAbsoluteTime t1 = CFAbsoluteTimeGetCurrent();
    NSInteger count = _data.count;
    NSInteger sum = 0;
    for (int i=0; i<count; i++) {
        ThreadItem *item = [_data objectAtIndex:i];
        NSInteger value = [self complexCalculateWithNumber:item.number];
        sum = sum + value;
    }
    CFAbsoluteTime t2 = CFAbsoluteTimeGetCurrent();
    NSLog(@"sylar : sum= %ld time = %f", sum, t2-t1);
}




- (NSInteger)complexCalculateWithNumber:(NSInteger)number {
    
    
//    CFAbsoluteTime t1 = CFAbsoluteTimeGetCurrent();
    
    NSInteger big = [self bigNumber:number];
    NSInteger sum = 0;
    for (int i=0; i<big; i++) {
        sum = sum + i;
    }
    
//    NSLog(@"sylar :  sum = %ld", (long)sum);
    
//    CFAbsoluteTime t2 = CFAbsoluteTimeGetCurrent();
//    NSLog(@"sylar :  time = %f", t2-t1);
    
    NSInteger rt = sum % ((number-1) * (number-1));
    
    NSLog(@"sylar :  calculate = %ld (%ld)", number, rt);
    return rt;
}

- (NSInteger)bigNumber:(NSInteger)value {
    NSInteger rt = value;
    NSInteger big = 3;
    for (int i=0; i<big; i++) {
        rt = rt * value;
    }
    return rt;
}



/**
 线程开几个

 @return 4 for simulator,  2 for iphone6s
 */
- (NSInteger)maxThreadCount {
    NSInteger count = 0;
    if (count == 0) {
        size_t len;
        unsigned int ncpu;
        
        len = sizeof(ncpu);
        sysctlbyname("hw.ncpu", &ncpu, &len, NULL, 0);
        count = ncpu;
    }
    
    return count;
}


@end

//
//  MathProblem1VCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/9/24.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "MathProblem1VCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface MathProblem1VCTL ()

@property (nonatomic, strong) NSArray *numbers;
@property (nonatomic, strong) NSMutableArray *currentNumber;
@property (nonatomic, assign) NSInteger maxNumber;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation MathProblem1VCTL


// refer to mp1.jpg
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self calculate1];
    
    [self calculate2];
}

- (void) calculate1
{
    _numbers = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", nil];
    
    for (int i=0; i<=7; i++)
    {
        for (int j=0; j<=7; j++)
        {
            if (j>i)
            {
                _currentNumber = [_numbers mutableCopy];
                [_currentNumber exchangeObjectAtIndex:i withObjectAtIndex:j];
//                NSLog(@"i = %d, j = %d", i, j);
                [self printAnswer];
                BOOL valid = [self checkValid];
                if (valid)
                {
                    NSLog(@"valid");
                    
                    [self printAnswer];
                    i=10;
                    j=10;
                }
            }
        }
    }
}

- (void) calculate2
{
    _currentNumber = [[NSMutableArray alloc] initWithObjects:@"1", @"1", @"1", @"1", @"1", @"1", nil];
    _maxNumber = 15;
    
    [self plusOne];
    
}

- (void) plusOne
{
    BOOL ww = YES;
    do {
        for (int i=0; i<=5; i++)
        {
            NSInteger the_number = [[_currentNumber objectAtIndex:i] integerValue];
            if (the_number >= _maxNumber)
            {
                if (i == 5)
                {
                    ww = NO;
                    break;
                }
                else
                {
                    [_currentNumber replaceObjectAtIndex:i withObject:@"1"];
                }
                
            }
            else
            {
                [_currentNumber replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%ld", the_number+1]];
                
                
                BOOL vv = [self checkValid2];
                if (vv)
                {
                    [self printAnswer];
                    NSLog(@"ooooooooooooo");
                    ww = NO;
                    i = 100;
                    break;
                }
                break;
            }
            
        }
        
    } while (ww);
    
    
    NSLog(@"end");
}

- (BOOL) checkValid2
{
    BOOL rt = NO;
    NSInteger a1 = [[_currentNumber objectAtIndex:0] integerValue];
    NSInteger a2 = 4+9-a1;
    NSInteger a3 = [[_currentNumber objectAtIndex:1] integerValue];
    NSInteger a4 = [[_currentNumber objectAtIndex:2] integerValue];
    NSInteger a5 = [[_currentNumber objectAtIndex:3] integerValue];
    NSInteger a6 = [[_currentNumber objectAtIndex:4] integerValue];
    NSInteger a7 = [[_currentNumber objectAtIndex:5] integerValue];
    NSInteger a8 = 9-a5-4;
    
    CGFloat f3 = [[_currentNumber objectAtIndex:1] floatValue];
    CGFloat f6 = [[_currentNumber objectAtIndex:4] floatValue];

    CGFloat a36 = (CGFloat)f3/f6;
    
    NSLog(@"a36 = %f", a36);
  
    NSLog(@"%d, %d, %d, %d, %d, %d, %d, %d", a1, a2, a3, a4, a5, a6, a7, a8);
    
    do {
        if (a1+a2-9 == 4 && a3-a4*a5 == 4 && a6+a7-a8 == 4 && a1+a36 == 4 && a2-a4*a7 ==4 && 9-a5-a8==4)
        {
            rt = YES;
        }
        
        
        
    } while (NO);
    
    
    return rt;
}


- (void) printAnswer
{
    for (int i=0; i<=7; i++)
    {
        NSLog(@"i = %@", [_currentNumber objectAtIndex:i]);
    }
}

- (BOOL) checkValid
{
    BOOL rt = NO;
    NSInteger a1 = [[_currentNumber objectAtIndex:0] integerValue];
    NSInteger a2 = [[_currentNumber objectAtIndex:1] integerValue];
    NSInteger a3 = [[_currentNumber objectAtIndex:2] integerValue];
    NSInteger a4 = [[_currentNumber objectAtIndex:3] integerValue];
    NSInteger a5 = [[_currentNumber objectAtIndex:4] integerValue];
    NSInteger a6 = [[_currentNumber objectAtIndex:5] integerValue];
    NSInteger a7 = [[_currentNumber objectAtIndex:6] integerValue];
    NSInteger a8 = [[_currentNumber objectAtIndex:7] integerValue];
    
    CGFloat a36 = (CGFloat) a3/a6;
    
    NSLog(@"a36 = %f", a3);
    
    NSLog(@"%d, %d, %d, %d, %d, %d, %d, %d", a1, a2, a3, a4, a5, a6, a7, a8);
    
    do {
        if (a1+a2-9 == 4 && a3-a4*a5 == 4 && a6+a7-a8 == 4 && a1+a36 == 4 && a2-a4*a7 ==4 && 9-a5-a8==4)
        {
            rt = YES;
            NSLog(@"correct");
            NSLog(@"-------- %d, %d, %d, %d, %d, %d, %d, %d", a1, a2, a3, a4, a5, a6, a7, a8);
        }
        
        
        
    } while (NO);
    
    
    return rt;
}



@end

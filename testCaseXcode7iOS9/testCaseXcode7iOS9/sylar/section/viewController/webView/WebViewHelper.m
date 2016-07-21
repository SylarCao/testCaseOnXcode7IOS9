//
//  WebViewHelper.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/7/21.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "WebViewHelper.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface WebViewHelper()

@property (nonatomic, strong) NSString *url;

@property (nonatomic, strong) NSArray *stockCode;

@property (nonatomic, assign) NSInteger index;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation WebViewHelper

+ (instancetype)share
{
    static WebViewHelper *inst = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        inst = [[WebViewHelper alloc] init];
    });
    return inst;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _url = @"http://mnews.gw.com.cn/wap/data/ipad/stock/SZ/BBBBB/AAAAA/f10/f10.html?themeStyleVs=1&qsThemeSign=1";
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"stockCode" ofType:@"txt"];
        NSString *ss = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        
        NSArray *arr = [ss componentsSeparatedByString:@"XS"];
        NSMutableArray *mm = [[NSMutableArray alloc] init];
        
        for (NSString *each_string in arr)
        {
            NSRange range = [each_string rangeOfString:@"\r"];
            if (range.location != NSNotFound)
            {
                NSString *code = [each_string substringWithRange:NSMakeRange(range.location+1, 6)];
                if ([code rangeOfString:@"002"].location == 0)
                {
                    [mm addObject:code];
                }
            }
            else
            {
                NSLog(@"can't find %@", each_string);
            }
        }
        _stockCode = mm;
        
        _index = 0;
    }
    return self;
}


- (NSString *)getUrlAutoIncrease
{
    _index ++;
    if (_index > _stockCode.count)
    {
        _index = 0;
    }
    NSString *rt = _url;
    NSString *code = [_stockCode objectAtIndex:_index];
    rt = [rt stringByReplacingOccurrencesOfString:@"AAAAA" withString:code];
    
    if (code.length == 6)
    {
        code = [code substringFromIndex:4];
        rt = [rt stringByReplacingOccurrencesOfString:@"BBBBB" withString:code];
    }
    else
    {
        NSLog(@"how");
        rt = [self getUrlAutoIncrease];
    }
    
    
    return rt;
}

@end

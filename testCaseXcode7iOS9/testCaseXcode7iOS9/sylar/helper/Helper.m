//
//  Helper.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/9/25.
//  Copyright © 2015年 sylar. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+ (instancetype) share
{
    static Helper *inst = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        inst = [[Helper alloc] init];
    });
    return inst;
}

- (UIColor *) getRandomColor
{
    UIColor *rt = [self getRandomColorWithAlpha:1];
    return rt;
}

- (UIColor *)getRandomColorWithAlpha:(CGFloat)alpha
{
    NSInteger r = arc4random()%250;
    NSInteger g = arc4random()%250;
    NSInteger b = arc4random()%250;
    
    UIColor *rt = [UIColor colorWithRed:r/255.9 green:g/255.9 blue:b/255.9 alpha:alpha];
    return rt;
}


- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (NSString *) getVersion
{
    NSString *rt = [UIDevice currentDevice].systemVersion;
    return rt;
}

- (BOOL) checkVersion:(NSInteger)version
{
    BOOL rt = NO;
    NSString *current_version = [self getVersion];
    if (version == [current_version integerValue])
    {
        rt = YES;
    }
    return rt;
}

- (BOOL) checkSimulator
{
//    UIDevice *current = [UIDevice currentDevice];
//    NSString *name = current.name;
//    NSString *model = current.model;
//    NSString *localizedModel = current.localizedModel;
//    NSString *systemName = current.systemName;
//    NSString *systemVersion = current.systemVersion;
//    
//    NSLog(@"name = %@", name);
//    NSLog(@"model = %@", model);
//    NSLog(@"localizedModel = %@", localizedModel);
//    NSLog(@"systemName = %@", systemName);
//    NSLog(@"systemVersion = %@", systemVersion);
//    
//    BOOL b1 = TARGET_OS_IPHONE;   // always 1 on simulator or ipad
    BOOL rt = TARGET_OS_SIMULATOR;

    return rt;
}

- (NSString *)getHomeDocumentsPath
{
    NSString *rt = [NSString stringWithFormat:@"%@/Documents", NSHomeDirectory()];
    return rt;
}


@end

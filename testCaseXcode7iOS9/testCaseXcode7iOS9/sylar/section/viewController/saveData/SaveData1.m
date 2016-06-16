//
//  SaveData1.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/6/16.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import "SaveData1.h"

@implementation SaveData1

+ (void)crash
{
    NSArray *aa = nil;
    
    NSDictionary *dd = @{@"key": aa};
}

+ (void)save1
{
//    [self createLocalDirectory];
    
    [self fun1];
}

+ (void)createLocalDirectory
{
    NSString *path =[NSString stringWithFormat:@"%@/Documents/test1", NSHomeDirectory()];
    BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    NSLog(@"create directory = %d", success);
}

+ (void)fun1
{
    NSString *ss = @"abcde1";
    NSString *path =[NSString stringWithFormat:@"%@/Documents/test1/data1", NSHomeDirectory()];
    NSData *d1 = [ss dataUsingEncoding:NSUTF8StringEncoding];
    [[NSFileManager defaultManager] createFileAtPath:path contents:d1 attributes:nil];
}

@end

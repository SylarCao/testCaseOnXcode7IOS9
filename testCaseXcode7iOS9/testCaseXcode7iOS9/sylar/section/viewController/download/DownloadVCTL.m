//
//  DownloadVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/21.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "DownloadVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DownloadVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DownloadVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)btn1:(id)sender
{
//    [self fun1];
    
    [self fun2];
    
//    [self fun3];
}

- (void)fun3
{
    for (NSInteger i = 277452; i<279812; i++)  // 2360 个
    {
        [self downloadRizhi:i];
    }
    
}

- (void)downloadRizhi:(NSInteger)number
{
    NSString *directory_path = [NSString stringWithFormat:@"%@/yyzRizhi", kHomeDocumentsPath];
    BOOL directory_exist = [[NSFileManager defaultManager] fileExistsAtPath:directory_path];
    if (directory_exist == NO)
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:directory_path withIntermediateDirectories:YES attributes:nil error:nil];
        
    }
    
    NSString *url = [NSString stringWithFormat:@"http://114.141.165.114/applog/breakdown/2016/12/%ld_logfile.log", number];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSString *path = [NSString stringWithFormat:@"%@/log%ld.log", directory_path, number];
    BOOL save = [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
    
    NSLog(@"sylar :  save(%ld).success = %ld", number, (long)save);
}

- (void)fun2
{
    NSString *directory_path = [NSString stringWithFormat:@"%@/yyzRizhi", kHomeDocumentsPath];
    BOOL directory_exist = [[NSFileManager defaultManager] fileExistsAtPath:directory_path];
    if (directory_exist == NO)
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:directory_path withIntermediateDirectories:YES attributes:nil error:nil];

    }
    
    
    NSString *url = @"http://114.141.165.114/applog/breakdown/2016/12/278548_logfile.log";
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSString *path = [NSString stringWithFormat:@"%@/a.log", directory_path];
    NSLog(@"sylar :  path = %@", path);
    [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
    
}

- (void)fun1
{
    NSString *url = @"http://zjdx1.sc.chinaz.com/Files/DownLoad/sound1/201501/5383.mp3";
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    
    NSLog(@"data = %@", data);
    
    NSString *path = [NSString stringWithFormat:@"%@/aaa.mp3", kHomeDocumentsPath];
    BOOL ss = [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
#pragma clang diagnostic ignored "-Wformat"
    NSLog(@"ss = %ld", ss);
#pragma clang diagnostic pop
    

}

@end

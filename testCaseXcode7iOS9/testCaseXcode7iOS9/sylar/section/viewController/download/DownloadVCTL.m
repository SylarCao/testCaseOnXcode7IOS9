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
    [self fun1];
}


- (void)fun1
{
    NSString *url = @"http://zjdx1.sc.chinaz.com/Files/DownLoad/sound1/201501/5383.mp3";
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    
    NSLog(@"data = %@", data);
    
    NSString *path = [NSString stringWithFormat:@"%@/aaa.mp3", kHomeDocumentsPath];
    BOOL ss = [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
    NSLog(@"ss = %ld", ss);
}

@end

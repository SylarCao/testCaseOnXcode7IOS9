//
//  ScriptVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/6/1.
//  Copyright © 2018年 sylar. All rights reserved.
//

#import "ScriptVCTL.h"
//#import <nstas"

@interface ScriptVCTL ()

@end

@implementation ScriptVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender {
    [self fun1];
}

- (void)fun1 {
    NSLog(@"sylar : fun1");
//    NSTask *task = [[NSTask alloc] init];
//    [task setLaunchPath:@"/path/to/script/sh"];
//    [task setArguments:[NSArray arrayWithObjects:@"yourScript.sh", nil]];
//    [task setStandardOutput:[NSPipe pipe]];
//    [task setStandardInput:[NSPipe pipe]];
//
//    [task launch];
//    [task release];
}

@end

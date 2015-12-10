//
//  Dealloc2VCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/8.
//  Copyright © 2015年 sylar. All rights reserved.
//

#import "Dealloc2VCTL.h"

@interface Dealloc2VCTL ()

@end

@implementation Dealloc2VCTL

- (void)dealloc
{
    NSLog(@"dealloc 22222");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

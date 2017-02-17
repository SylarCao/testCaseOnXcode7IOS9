//
//  BasicVCTL.m
//  testCase
//
//  Created by sylar on 15/9/21.
//  Copyright (c) 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "BasicVCTL.h"
#import "MBProgressHUD.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BasicVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BasicVCTL

- (void)dealloc
{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.title = NSStringFromClass([self class]);
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:nil action:nil];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

//- (void)enterForeground
//{
//    NSLog(@"enter foreground");
//}
//
//- (void)enterBackground
//{
//    NSLog(@"enter Background");
//}


- (void) showHudWithContent:(NSString *)content
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = content;
    hud.margin = 20;;
    [hud hide:YES afterDelay:1];
    
}

@end

//
//  NavigationBarVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/8.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "NavigationBarVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface NavigationBarVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NavigationBarVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviBarHeight];
    [self setWindowFrame];
    
    [self setNavi1];
    
    [self setWithRightItem2];
}

- (void) setNavi1
{
    self.navigationItem.titleView = [self getView1];
}

- (UIView *)getView1
{
    UIView *rt = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    rt.backgroundColor = [UIColor yellowColor];
    
    
    return rt;
}

- (void) setNaviBarHeight
{
    // for iphone 5
    CGFloat f1 = self.navigationController.navigationBar.frame.size.height;
    CGFloat f2 = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    
    NSLog(@"iphone 5 (44, 20) -- %f --- %f", f1, f2);
    NSLog(@"iphone 6 plus (44, 20) -- %f --- %f", f1, f2);
    
}

- (void) setWindowFrame
{
    CGSize ss = self.view.frame.size;
    
    NSLog(@"frame = %f, %f", ss.width, ss.height);
}

- (void)setWithRightItem1
{
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"right1" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.rightBarButtonItems = @[item1, item2];
}

- (void)setWithRightItem2
{
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"small_30"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"small_30"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    
    self.navigationItem.rightBarButtonItems = @[item1, item2];
}





@end

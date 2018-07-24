//
//  BackItemVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/7/23.
//  Copyright © 2018年 sylar. All rights reserved.
//

#import "BackItemVCTL.h"

@interface BackItemVCTL () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) id<UIGestureRecognizerDelegate> backDelegate;

@end

@implementation BackItemVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self setBack1];
    
//    [self fun1];
    
    [self fun2];
    
//    [self fun3];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 在root的时候在右滑 会卡住 需要delegate设置回来
    if (_backDelegate) {
        self.navigationController.interactivePopGestureRecognizer.delegate = _backDelegate;
    }
}

- (void)fun3 {
    // 隐藏 返回按钮
}

- (void)fun2 {

//    UIImage* back_normal = [UIImage imageNamed:@"img_back"];
//    UIImage* back_HL = [UIImage imageNamed:@"img_back"];
//    UIEdgeInsets inset = UIEdgeInsetsMake(0, back_normal.size.width/2, 0, back_normal.size.width/2-2);
//    UIImage *back_normal_resize = [back_normal resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch];
//    UIImage *back_HL_resize = [back_HL resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch];
//    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:nil action:NULL];
//    [back setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor darkGrayColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateNormal];
//    [back setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor clearColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateHighlighted];
//    [back setBackButtonBackgroundImage:back_normal_resize forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    [back setBackButtonBackgroundImage:back_HL_resize forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//    [back setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, -5) forBarMetrics:UIBarMetricsDefault];
//    [self.navigationItem setBackBarButtonItem:back];
//    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    // ios11 用下边的3句话，并且把backBarButtonItem设置成没有图片和文字的 见 BasicVCTL
    // 设置了以后，所有的都会改变
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIImage *backButtonImage = [[UIImage imageNamed:@"img_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.navigationController.navigationBar.backIndicatorImage = backButtonImage;
        self.navigationController.navigationBar.backIndicatorTransitionMaskImage = backButtonImage;
    });
}

- (void)fun1 {
    // 这个方法可以 右滑返回， 也可以用 RootNavigationVCTL
    id aaa = self.navigationController.interactivePopGestureRecognizer.delegate;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    NSLog(@"sylar : aaaa = %@", aaa);
    _backDelegate = aaa;
}

- (void)setBack1 {
    UIImage *img = [UIImage imageNamed:@"img_back"];
    img = [[UIImage imageNamed:@"img_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target:self action:@selector(actionBack)];
    [self.navigationItem setLeftBarButtonItem:back];
}

- (void)actionBack {
    NSLog(@"sylar : tap back    ");
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)btn1Action:(id)sender {
    BackItemVCTL *v = [[BackItemVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:v animated:YES];
}

@end

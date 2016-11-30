//
//  GJWebViewVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/11/30.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "GJWebViewVCTL.h"
#import "GJWebView.h"
#import "Masonry.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface GJWebViewVCTL ()
<GJWebViewDelegate>

@property (nonatomic, strong) UIView *v1;
@property (nonatomic, strong) UIScrollView *s1;
@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) GJWebView *w1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation GJWebViewVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self fun1];
    
    [self fun2];
    
}

- (IBAction)btn1:(id)sender
{
    NSString *u1 = @"http://mp.weixin.qq.com/s?__biz=MTgwNTE3Mjg2MA==&mid=2652509300&idx=1&sn=e719932b4bd83a493496ce282efbada8&chksm=584983676f3e0a71979ef77fea119ef1bd82cabf614ad7e16aa2430c1eada8c57465dc48ca13&scene=0#rd";
    
    u1 = @"http://mnews.gw.com.cn/wap/data/ipad/stock/SZ/63/002563/f10/f10.html?themeStyleVs=1&qsThemeSign=1";
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL: [NSURL URLWithString:[u1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]
                                                cachePolicy: NSURLRequestUseProtocolCachePolicy
                                            timeoutInterval: 60.0];
    
    [_w1 loadRequest:urlRequest];
}

- (void)fun2
{
    // 一个UIScrollView 上的view 上加载 GJWebView
    _s1 = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 100, 300, 400)];
    _s1.contentSize = CGSizeMake(300, 2417);
    [self.view addSubview:_s1];
    _s1.layer.borderColor = [UIColor redColor].CGColor;
    _s1.layer.borderWidth = 1;
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 10)];
    [_s1 addSubview:_contentView];
    
    
    GJWebView *w1 = [[GJWebView alloc] initWithFrame:CGRectZero];
    w1.delegate = self;
    w1.scrollView.scrollEnabled = NO;
    _w1 = w1;
    [_contentView addSubview:w1];
    
    [w1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset = 0;
        make.bottom.offset = 0;
        make.left.offset = 0;
        make.right.offset = 0;
    }];
    
    
}

- (void)fun1
{
    // 一个view 上加载 GJWebView
    _v1 = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 300, 400)];
    [self.view addSubview:_v1];
    _v1.layer.borderColor = [UIColor redColor].CGColor;
    _v1.layer.borderWidth = 1;
    
    GJWebView *w1 = [[GJWebView alloc] initWithFrame:CGRectZero];
    w1.delegate = self;
    _w1 = w1;
    [_v1 addSubview:w1];
    
    [w1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset = 0;
        make.bottom.offset = 0;
        make.left.offset = 0;
        make.right.offset = 0;
    }];
}

#pragma mark - GJWebViewDelegate
- (void)webViewDidFinishLoad:(GJWebView *)webView
{
    NSLog(@"sylar :  finish = %f", webView.scrollView.contentSize.height);  // finish = 2417
    
    
    CGFloat w = _s1.frame.size.width;
    CGFloat h = webView.scrollView.contentSize.height;
    
    _s1.contentSize = CGSizeMake(w, h);
    _contentView.frame = CGRectMake(0, 0, w, h);
    
}

@end

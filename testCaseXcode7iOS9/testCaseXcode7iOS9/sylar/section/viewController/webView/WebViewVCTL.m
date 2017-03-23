//
//  WebViewVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/31.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "WebViewVCTL.h"
#import "WebViewHelper.h"
#import "Masonry.h"
#import <WebKit/WebKit.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
const BOOL kUseWKWebView = 1;
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface WebViewVCTL ()
<WKNavigationDelegate, WKUIDelegate>

@property (nonatomic, strong) NSString *kvoKeyPath;

@property (nonatomic, weak) IBOutlet UIWebView *web1;
@property (nonatomic, weak) IBOutlet UILabel *content;
@property (nonatomic, strong) NSString *bigImageUrl;

// WKWebView
@property (nonatomic, strong) WKWebView *web2;


@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation WebViewVCTL

- (void)dealloc
{
    NSLog(@"dealloc");
    [_web1 stopLoading];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (kUseWKWebView) {
        _web1.hidden = YES;
        _web2 = [[WKWebView alloc] initWithFrame:CGRectZero];
        _web2.UIDelegate = self;
        _web2.navigationDelegate = self;
        [self.view addSubview:_web2];
        [_web2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset = 0;
            make.bottom.offset = 0;
            make.left.offset = 0;
            make.right.offset = 0;
        }];
    }
    
    [self addWebViewHeightObserver];
    
//    [self setConfig];
    
//    [self setInitialValue];
    
//    NSLog(@"tag = %ld", _tag1);

//    [self fun1];
    
//    [self fun2];
    
    [self fun3];
    
    
}

- (void)fun3 {
    NSString *s1 = @"http://36kr.com/p/5063512.html";
//    s1 = @"https://www.baidu.com/";
    s1 = @"https://i.gtja.com/quotes/securities/diagnoseEplus/trading/index.html?stockCode=002253&market=SZ&color=white";  // 诊股
    s1 = @"https://mnews.gw.com.cn/wap/data/ipad/stock/SZ/39/000639/f10/f10.html?themeStyleVs=1&qsThemeSign=1";  // f10
    NSString *url = s1;
    NSURL *url1 = [NSURL URLWithString:url];
    NSURLRequest *rr = [[NSURLRequest alloc] initWithURL:url1];
    [_web2 loadRequest:rr];
}

- (void)addWebViewHeightObserver {
    // webview 高度变化 kvo
    
    if (kUseWKWebView) {
        self.kvoKeyPath = @"self.web2.scrollView.contentSize";
    } else {
        self.kvoKeyPath = @"self.web1.scrollView.contentSize";
    }
    [self addObserver:self forKeyPath:self.kvoKeyPath options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    CGFloat width = 0;
    CGFloat height = 0;
    if (kUseWKWebView) {
        width = _web2.scrollView.contentSize.width;
        height = _web2.scrollView.contentSize.height;
    } else {
        width = _web1.scrollView.contentSize.width;
        height = _web1.scrollView.contentSize.height;
    }
    // 诊股的网址用WKWebView有问题，contentsize一直在变，但是实际没有变
    NSLog(@"obobob = %f, %f", width, height);
}

- (void)fun2 {
    NSString *s1 = @"http://36kr.com/p/5063512.html";
    s1 = @"https://i.gtja.com/quotes/securities/diagnoseEplus/trading/index.html?stockCode=002253&market=SZ&color=white";
    NSString *url = s1;
    NSURL *url1 = [NSURL URLWithString:url];
    NSURLRequest *rr = [[NSURLRequest alloc] initWithURL:url1];
    [_web1 loadRequest:rr];
}

- (void)fun1
{
    // 测试股票f10 的
    NSString *url = [[WebViewHelper share] getUrlAutoIncrease];
    NSURL *url1 = [NSURL URLWithString:url];
    NSURLRequest *rr = [[NSURLRequest alloc] initWithURL:url1];
    [_web1 loadRequest:rr];
}

- (void)setConfig
{
//    _bigImageUrl = @"http://dev.gtjabadminton.avosapps.com/bigWebView";
    _bigImageUrl = @"http://www.sanguosha.com/";
}

- (void)setInitialValue
{
    NSURL *url1 = [NSURL URLWithString:_bigImageUrl];
    NSURLRequest *rr = [[NSURLRequest alloc] initWithURL:url1];
    [_web1 loadRequest:rr];
}

- (IBAction)btn1:(id)sender
{
    if ([_web1 canGoBack]) {
        [_web1 goBack];
    } else {
        NSLog(@"sylar :  can't go back");
    }
//    WebViewVCTL *w1 = [[WebViewVCTL alloc] initWithNibName:nil bundle:nil];
//    w1.tag1 = _tag1+1;
//    [self.navigationController pushViewController:w1 animated:YES];
}

- (IBAction)btn2:(id)sender
{
//    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"did start");
    CGFloat height = _web1.scrollView.contentSize.height;
    NSLog(@"sylar :  start height = %f", height);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"did finish");
    CGFloat height = _web1.scrollView.contentSize.height;
    NSLog(@"sylar :  end height = %f", height);

}

#pragma mark - WKUIDelegate, WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"sylar :  start ");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"sylar :  did finish");
    CGFloat height = _web2.scrollView.contentSize.height;
    NSLog(@"sylar :  end height = %f", height);
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSLog(@"sylar :  action");
    NSURL *url = navigationAction.request.URL;
    
    
//    NSLog(@"sylar :  <#info#>");
    decisionHandler(WKNavigationActionPolicyAllow);

}

@end

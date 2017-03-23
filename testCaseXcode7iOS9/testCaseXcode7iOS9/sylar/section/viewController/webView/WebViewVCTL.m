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
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface WebViewVCTL ()

@property (nonatomic, weak) IBOutlet UIWebView *web1;

@property (nonatomic, weak) IBOutlet UILabel *content;

@property (nonatomic, strong) NSString *bigImageUrl;


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
    // Do any additional setup after loading the view from its nib.
    
//    [self setConfig];
    
//    [self setInitialValue];
    
//    NSLog(@"tag = %ld", _tag1);

//    [self fun1];
    
    [self fun2];
    
    
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

@end

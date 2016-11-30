//
//  GJWebView.m
//
//  Created by Bogdan Hapca on 07/01/15.
//  Copyright (c) 2015 Yardi. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "GJWebView.h"
#import "Masonry.h"


#define DESTROY_UIWEBVIEW_ARC(__WEBVIEW)   { __WEBVIEW.delegate = nil; [__WEBVIEW stopLoading]; __WEBVIEW = nil; }
#define DESTROY_WKWEBVIEW_ARC(__WEBVIEW)   { __WEBVIEW.navigationDelegate = nil; [__WEBVIEW stopLoading]; __WEBVIEW = nil; }
#define DESTROY_ALERTVIEW_ARC(__ALERTVIEW) {__strong UIAlertView *alertView = __ALERTVIEW; if (alertView.delegate == self) alertView.delegate = nil; alertView = nil; }

@interface GJWebView () <UIWebViewDelegate, WKNavigationDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) WKWebView *webViewWK;
@property (nonatomic, strong) WKWebViewConfiguration *webViewWKConfig;

@property (nonatomic, strong) NSTimer *guardTimer;
@property (nonatomic, strong) UIAlertView *callAlertView;
@property (nonatomic, assign) BOOL forceUIWebView;

@end


@implementation GJWebView

- (id)internalWebView{
    if (_webView) {
        return _webView;
    }
    
    if (_webViewWK) {
        return _webViewWK;
    }
    
    return nil;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.webViewWK setNeedsLayout];
    [self.webView setNeedsLayout];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self doInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self doInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame forceUIWebView:(BOOL)force{
    self = [super initWithFrame:frame];
    if (self) {
        self.forceUIWebView = force;
        [self doInit];
    }
    return self;
}

+ (WKProcessPool*)processPool {
    static WKProcessPool *pool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pool = [[WKProcessPool alloc] init];
    });
    
    return pool;
}

- (void)doInit {
    if (NSClassFromString(@"WKWebView") == nil || self.forceUIWebView == YES) {
        _webView = [[UIWebView alloc] initWithFrame:self.frame];
        _webView.delegate = self;
        _webView.suppressesIncrementalRendering = YES;
        _webView.scalesPageToFit = YES;
        _webView.dataDetectorTypes = UIDataDetectorTypeLink | UIDataDetectorTypeCalendarEvent | UIDataDetectorTypeAddress;
        
        [self addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    } else {
        _shareProcessPool = YES;
        [self configureWKWebView];
    }
}

- (void)configureWKWebView {
    if (_shareProcessPool) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        config.processPool = [[self class] processPool];
        config.allowsInlineMediaPlayback = YES;
        _webViewWK = [[WKWebView alloc] initWithFrame:self.frame configuration:config];
        
        self.webViewWKConfig = config;
    } else {
        _webViewWK = [[WKWebView alloc] initWithFrame:self.frame];
    }
    
        _webViewWK.navigationDelegate = self;
        [self addSubview:_webViewWK];
        [_webViewWK mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }

- (void)dealloc {
    DESTROY_UIWEBVIEW_ARC(_webView);
    DESTROY_WKWEBVIEW_ARC(_webViewWK);
    DESTROY_ALERTVIEW_ARC(_callAlertView);
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (UIScrollView*)scrollView {
    if (self.webView) {
        return self.webView.scrollView;
    } else {
        NSAssert(self.webViewWK, @"sanity check");
        return self.webViewWK.scrollView;
    }
}


#pragma mark -
- (void)loadRequest:(NSURLRequest *)request {
    [self.webView loadRequest:request];
    [self.webViewWK loadRequest:request];
}

- (void)loadRequest:(NSURLRequest *)request timeOut:(NSTimeInterval)timeOut {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.guardTimer invalidate];
        self.guardTimer = [NSTimer scheduledTimerWithTimeInterval:timeOut target:self selector:@selector(guardTimerExceeded:) userInfo:nil repeats:NO];
    });
    
    [self loadRequest:request];
}

- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL {
    [self.webView loadHTMLString:string baseURL:baseURL];
    [self.webViewWK loadHTMLString:string baseURL:baseURL];
}

- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL timeOut:(NSTimeInterval)timeOut {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.guardTimer invalidate];
        self.guardTimer = [NSTimer scheduledTimerWithTimeInterval:timeOut target:self selector:@selector(guardTimerExceeded:) userInfo:nil repeats:NO];
    });
    
    [self loadHTMLString:string baseURL:baseURL];
}

- (void)stopLoading {
    [self.webView stopLoading];
    [self.webViewWK stopLoading];
}


- (void)reload
{
    [self.webView reload];
    [self.webViewWK reload];
}

- (void)goBack
{
    [self.webView goBack];
    [self.webViewWK goBack];
}

- (void)goForward
{
    [self.webView goForward];
    [self.webViewWK goForward];
}

- (BOOL)canGoBack
{
    return [self.webView canGoBack] || [self.webViewWK canGoBack];
}

- (BOOL)canGoForward
{
    return [self.webView canGoForward] || [self.webViewWK canGoForward];
}

- (BOOL)isLoading
{
    return [self.webView isLoading] || [self.webViewWK isLoading];
}

- (NSString *)pageTitle
{
    NSString *pageTitle = [self.webViewWK title];
    
    if (pageTitle == nil) {
        pageTitle = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    }
    
    return pageTitle;
}

- (NSString *)urlString{
    NSString *urlString = [[self.webViewWK URL] absoluteString];
    
    if (urlString == nil) {
        urlString = [self.webView stringByEvaluatingJavaScriptFromString:@"document.href"];
    }
    return nil;
}

- (NSURLRequest *)request
{
    if ([self.webViewWK URL]) {
        return [NSURLRequest requestWithURL:[self.webViewWK URL]];
    }
    
    return [self.webView request];
}

- (void)guardTimerExceeded:(NSTimer*)timer {
    NSAssert(timer == self.guardTimer, @"sanity check");
    [self stopLoading];
    [self handleError:[NSError errorWithDomain:NSURLErrorDomain code:kCFURLErrorTimedOut userInfo:nil]];
}

- (void)evaluateJavaScriptFromString:(NSString *)script completionBlock:(JavaScriptCompletionBlock)block {
    if (self.webView) {
        NSString *jsResult = [self.webView stringByEvaluatingJavaScriptFromString:script];
        block(jsResult, nil);
    } else {
        NSAssert(self.webViewWK, @"sanity check");
        [self.webViewWK evaluateJavaScript:script completionHandler:^(id result, NSError *error) {
            NSString *jsResult = nil;
            if (!error) {
                if ([result isKindOfClass:[NSString class]]) {
                    jsResult = result;
                } else {
                    jsResult = [NSString stringWithFormat:@"%@", result];
                }
            } else {
                NSLog(@"%@", error);
            }
            
            block(jsResult, error);
        }];
    }
}

- (NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script{
    __block NSString *rs = nil;
    [self evaluateJavaScriptFromString:script completionBlock:^(NSString *result, NSError *error) {
        rs = result;
    }];
    return  rs;
}

- (void)handleStartLoad {
    if ([self.delegate respondsToSelector:@selector(webViewDidStartLoad:)]) {
        [self.delegate webViewDidStartLoad:self];
    }
}

- (void)handleFinishLoad {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.guardTimer invalidate];
    });
    
    if ([self.delegate respondsToSelector:@selector(webViewDidFinishLoad:)]) {
        [self.delegate webViewDidFinishLoad:self];
    }
}

- (void)handleError:(NSError*)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.guardTimer invalidate];
    });
    
    if ([self.delegate respondsToSelector:@selector(webView:didFailLoadWithError:)]) {
        [self.delegate webView:self didFailLoadWithError:error];
    }
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [self.webView setBackgroundColor:backgroundColor];
    [self.webViewWK setBackgroundColor:backgroundColor];
}

- (void)setShareProcessPool:(BOOL)shareProcessPool {
    if (_shareProcessPool != shareProcessPool) {
        _shareProcessPool = shareProcessPool;
        [_webViewWK removeFromSuperview];
        [self configureWKWebView];
    }
}

#pragma mark - UIWebViewDelegate methods
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self handleStartLoad];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self handleFinishLoad];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self handleError:error];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if ([self.delegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)]) {
        return [self.delegate webView:self shouldStartLoadWithRequest:request navigationType:mapUIWebViewNavigationTypeToGJWebViewNavigationType(navigationType)];
    } else {
        return YES;
    }
}

GJWebViewNavigationType mapUIWebViewNavigationTypeToGJWebViewNavigationType(UIWebViewNavigationType navigationType) {
    switch (navigationType) {
        case UIWebViewNavigationTypeLinkClicked:    {return GJWebViewNavigationTypeLinkClicked; break;}
        case UIWebViewNavigationTypeFormSubmitted:  {return GJWebViewNavigationTypeFormSubmitted; break;}
        case UIWebViewNavigationTypeBackForward:    {return GJWebViewNavigationTypeBackForward; break;}
        case UIWebViewNavigationTypeReload:         {return GJWebViewNavigationTypeReload; break;}
        case UIWebViewNavigationTypeFormResubmitted:{return GJWebViewNavigationTypeFormResubmitted; break;}
        case UIWebViewNavigationTypeOther:          {return GJWebViewNavigationTypeOther; break;}
    }
}

#pragma mark - WKNavigationDelegate methods
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [self handleStartLoad];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self handleFinishLoad];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    [self handleError:error];
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    [self handleError:error];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSURL *url = navigationAction.request.URL;
    if ([url.scheme isEqualToString:@"tel"]) {
        if ([[UIDevice currentDevice].systemVersion floatValue] < 8.3) {
            NSString *phoneNo = [url.absoluteString substringFromIndex:6];
            // we need to prompt the user before initiating the call
            self.callAlertView = [[UIAlertView alloc] initWithTitle:nil message:phoneNo delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Call", nil];
            [self.callAlertView show];
        } else {
            [self openTelUrl:url];
        }
        decisionHandler(WKNavigationActionPolicyCancel);
        
    } else if ([url.scheme isEqualToString:@"mailto"]) {
        UIApplication *sharedApplication = [UIApplication sharedApplication];
        if (![sharedApplication canOpenURL:url] || ![sharedApplication openURL:url]) {
            [self showCantOpenURLAlert];
        }
        decisionHandler(WKNavigationActionPolicyCancel);
        
    } else if ([self.delegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)]) {
        if ([self.delegate webView:self shouldStartLoadWithRequest:navigationAction.request navigationType:mapWKNavigationTypeToGJWebViewNavigationType(navigationAction.navigationType)]) {
            decisionHandler(WKNavigationActionPolicyAllow);
        } else {
            decisionHandler(WKNavigationActionPolicyCancel);
        }
    } else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}

#pragma mark -
- (void)openTelUrl:(NSURL*)telUrl {
    UIApplication *app = [UIApplication sharedApplication];
    if (![app canOpenURL:telUrl] || ![app openURL:telUrl]) {
        [self showCantCallAlert];
    }
}

- (void)showCantCallAlert {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Your device can't make phone calls." delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)showCantOpenURLAlert {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"Can't open URL" delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil, nil];
    [alertView show];
}

GJWebViewNavigationType mapWKNavigationTypeToGJWebViewNavigationType(WKNavigationType navigationType) {
    switch (navigationType) {
        case WKNavigationTypeLinkActivated: {return GJWebViewNavigationTypeLinkClicked; break;}
        case WKNavigationTypeFormSubmitted: {return GJWebViewNavigationTypeFormSubmitted; break;}
        case WKNavigationTypeBackForward: {return GJWebViewNavigationTypeBackForward; break;}
        case WKNavigationTypeReload: {return GJWebViewNavigationTypeReload; break;}
        case WKNavigationTypeFormResubmitted: {return GJWebViewNavigationTypeFormResubmitted; break;}
        case WKNavigationTypeOther: {return GJWebViewNavigationTypeOther; break;}
    }
}

#pragma mark - UIAlertViewDelegate method
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSAssert(alertView == self.callAlertView, @"sanity check");
    if (buttonIndex == 1) {
        NSURL *telUrl = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", alertView.message]];
        [self openTelUrl:telUrl];
    }
}

@end

@implementation GJWebView (Utility)

- (NSString *)currentUrl
{
    return self.urlString;
}

- (NSString*)currentTitle
{
    NSString *currentTitle = self.pageTitle;
    return currentTitle;
}


- (NSString *)getDocumentElement:(NSString *)element name:(NSString *)name{
    NSString *resultStr = @"";
    NSString *jsSource = [NSString stringWithFormat:@"var tags = document.getElementsByTagName('%@');",element];
    resultStr = [self stringByEvaluatingJavaScriptFromString:jsSource];
    jsSource = @"var result;";
    resultStr = [self stringByEvaluatingJavaScriptFromString:jsSource];
    jsSource = [NSString stringWithFormat:@"for(i in tags){if(typeof tags[i].name!=\"undefined\"&&tags[i].name.toLowerCase()==\"%@\"){share_desc = tags[i].content;}}",name];
    resultStr = [self stringByEvaluatingJavaScriptFromString:jsSource];
    return resultStr;
}

@end


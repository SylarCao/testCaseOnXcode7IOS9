//
//  WebViewVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/31.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "WebViewVCTL.h"
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
    
    [self setConfig];
    
    [self setInitialValue];
    
}

- (void)setConfig
{
    _bigImageUrl = @"http://dev.gtjabadminton.avosapps.com/bigWebView";
}

- (void)setInitialValue
{
    NSURL *url1 = [NSURL URLWithString:_bigImageUrl];
    NSURLRequest *rr = [[NSURLRequest alloc] initWithURL:url1];
    [_web1 loadRequest:rr];
}

- (IBAction)btn1:(id)sender
{
    WebViewVCTL *w1 = [[WebViewVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:w1 animated:YES];
}

@end

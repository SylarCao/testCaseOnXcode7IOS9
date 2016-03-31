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


@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation WebViewVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setInitialValue];
    
}

- (void)setInitialValue
{
    
}

- (IBAction)btn1:(id)sender
{
    WebViewVCTL *w1 = [[WebViewVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:w1 animated:YES];
}

@end

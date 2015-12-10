//
//  ShareWeiXinVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/1.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ShareWeiXinVCTL.h"
#import "WXApiRequestHandler.h"
#import "WXApi.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
// 登陆账号: 1718226968@qq.com
// AppDelegate 里也要修改
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ShareWeiXinVCTL ()



@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ShareWeiXinVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender
{
    [self shareWX1];
}

- (void)shareWX1
{
    // thumb_image 不能超过32k 否则会没有任何反应并且不报错
    UIImage *thumb_image = [UIImage imageNamed:@"sgs5TH"];
    
    NSString *link_url = @"http://dev.gtjabadminton.avosapps.com/shareWechat";
    
        link_url = @"http://dev.gtjabadminton.avosapps.com/shareWechat";
    
//    link_url = @"http://dev.gtjabadminton.avosapps.com/shareLengtu";
    
    //    link_url = @"http://mp.weixin.qq.com/s?__biz=MTgwNTE3Mjg2MA==&mid=400786108&idx=2&sn=e8f568747b30675a13988556f473af94&scene=23&srcid=1201fd2BimRFHqIf4WlOrbQn#rd";
    
    BOOL send1 = [WXApiRequestHandler sendLinkURL:link_url TagName:@"name1" Title:@"title1" Description:@"description1" ThumbImage:thumb_image InScene:WXSceneSession];
    NSLog(@"分享= %d", send1);
    
}

- (void)share9
{
    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"testiOS9://"]] )
    {
        NSLog(@"testiOS9 OK");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"testiOS9://"]];
    }
    else
    {
        NSLog(@"not open testiOS9");
    }
}



@end

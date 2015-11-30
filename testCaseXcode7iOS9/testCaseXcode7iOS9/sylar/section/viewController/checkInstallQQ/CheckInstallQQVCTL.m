//
//  CheckInstallQQVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/30.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "CheckInstallQQVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface CheckInstallQQVCTL ()

@property (nonatomic, weak) IBOutlet UILabel *lb1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
 info.plist 里 加入下边内容
 
 <key>LSApplicationQueriesSchemes</key>
     <array>
         <string>fbapi</string>
         <string>fbauth2</string>
         <string>fbshareextension</string>
         <string>fb-messenger-api</string>
         <string>twitter</string>
         <string>whatsapp</string>
         <string>wechat</string>
         <string>line</string>
         <string>instagram</string>
         <string>kakaotalk</string>
         <string>mqq</string>
         <string>vk</string>
         <string>comgooglemaps</string>
     </array>
 

*/
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation CheckInstallQQVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender
{
//    [self checkInstallFacebook];
//    [self checkInstallInstagram];
//    [self checkInstallWechat];
    [self checkInstallZZY1];
}

- (IBAction)btnOpenScore:(id)sender
{
    [self openScore];
}

- (void)openScore
{
    /* scoreboard 的plist 里
     <key>CFBundleURLTypes</key>
         <array>
             <dict>
                 <key>CFBundleURLSchemes</key>
                     <array>
                         <string>scoreBoard1</string>
                     </array>
             </dict>
         </array>
     
     */
    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"scoreBoard1://"]] )
    {
        NSLog(@"scoreBoard1 OK");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"scoreBoard1://"]];
    }
    else
    {
        NSLog(@"not open scoreBoard1");
    }
}

- (void) checkInstallFacebook
{
    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"fbapi://"]] )
    {
        NSLog(@"fb OK");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"fbapi://"]];
    }
    else
    {
        NSLog(@"not open facebook");
    }
}

- (void)checkInstallInstagram
{
    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"instagram://"]] )
    {
        NSLog(@"instagram installed");
        _lb1.text = @"instagram installed";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"instagram://"]];
    }
    else
    {
        NSLog(@"instagram NOT installed");
        _lb1.text = @"instagram not installed";
    }
}

- (void) checkInstallWechat
{
    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"wechat://app"]] )
    {
        NSLog(@"wechat OK");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"wechat://app"]];
    }
    else
    {
        NSLog(@"not open wechat");
    }
}

- (void)checkInstallZZY1
{
    if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"com.gtja.yhtkhdxsp://"]] )
    {
        NSLog(@"gtjaiosopenaccount OK");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"com.gtja.yhtkhdxsp://"]];
    }
    else
    {
        NSLog(@"not open gtjaiosopenaccount");
    }
}




@end

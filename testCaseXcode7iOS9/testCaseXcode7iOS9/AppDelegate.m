//
//  AppDelegate.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/9/23.
//  Copyright © 2015年 sylar. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeVCTL.h"
#import "Helper.h"
#import "SecurityStrategy.h"
//#import <JSPatch/JSPatch.h>
#import "OpeniOS9VCTL.h"
//#import "SaveData1.h"

@interface AppDelegate ()

@property (nonatomic, strong) UINavigationController *naviController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    HomeVCTL *hh = [[HomeVCTL alloc] initWithNibName:nil bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:hh];
    _naviController = nav;
    
    _window.rootViewController = nav;
    [_window addSubview:nav.view];
    [_window makeKeyAndVisible];
    
    // 3d touch
    UIApplicationShortcutItem *shortItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"斋打开" localizedTitle:@"斋打开"];
    UIApplicationShortcutItem *shortItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"弹框" localizedTitle:@"弹框"];
    NSArray *shortItems = [[NSArray alloc] initWithObjects:shortItem1, shortItem2, nil];
//    NSLog(@"%@", shortItems);
//    if (kIOSVersion(9))
//    {
//        [[UIApplication sharedApplication] setShortcutItems:shortItems];
//    }
    
//    // JSPatch
//    [JSPatch testScriptInBundle];
    
//    // 注册微信
//    BOOL register_wx = [WXApi registerApp:@"wx7b829ff9443d4102" withDescription:@"description123"];
//    NSLog(@"注册微信 = %d", register_wx);
    
    // home
    NSLog(@"home = %@", NSHomeDirectory());
    
//    // notification
//    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert
//                                            | UIUserNotificationTypeBadge
//                                            | UIUserNotificationTypeSound
//                                                                             categories:nil];
//    [application registerUserNotificationSettings:settings];
//    [application registerForRemoteNotifications];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
//    NSLog(@"applicationWillResignActive");
    
    //添加模糊效果
//    [SecurityStrategy addBlurEffect];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    NSLog(@"applicationDidEnterBackground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
//    NSLog(@"applicationWillEnterForeground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    NSLog(@"applicationDidBecomeActive");
    //移除模糊效果
//    [SecurityStrategy removeBlurEffect];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
//    [SaveData1 save1];
    
//    NSLog(@"applicationWillTerminate");
}

#pragma mark -  3d touch的效果
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    if ([shortcutItem.localizedTitle  isEqual: @"弹框"]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OPPS!" message:@"我的CTO叫佛山强" delegate:self cancelButtonTitle:@"哦" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
#pragma clang diagnostic pop
}

#pragma mark - 本地推送
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification*)notification{
    NSLog(@"didReceiveLocalNotification");
}

#pragma mark - 打开app
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    NSString *source = [options objectForKey:@"UIApplicationOpenURLOptionsSourceApplicationKey"];
    NSLog(@"source = %@", source);
    OpeniOS9VCTL *o9 = [[OpeniOS9VCTL alloc] initWithNibName:nil bundle:nil];
    [o9 fun1];
    [_naviController pushViewController:o9 animated:YES];
    
    return NO;
}

#pragma mark - 禁止 横屏 竖屏的 调整
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(nullable UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
}

@end

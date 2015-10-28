//
//  PushNotificationVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/27.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "PushNotificationVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface PushNotificationVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation PushNotificationVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)btn1:(id)sender
{
    [self push1];
}

- (IBAction)btn2:(id)sender
{
    
}

- (void) push1
{
    UILocalNotification *ll = [[UILocalNotification alloc] init];
    ll.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
//    ll.fireDate = [[NSDate date] dateByAddingTimeInterval:(10)];
    ll.applicationIconBadgeNumber = 2;
    ll.soundName = UILocalNotificationDefaultSoundName;
    ll.alertBody = @"body";
    ll.repeatInterval = NSCalendarUnitDay;
    ll.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                   @"v1", @"k1",
                   @"v2", @"k2",
                   nil];
    [[UIApplication sharedApplication] scheduleLocalNotification:ll];
}

- (void) cancelBadgeNumber
{
    
}

@end

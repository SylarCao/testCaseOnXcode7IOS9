//
//  TouchIDVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/11.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TouchIDVCTL.h"
#import "Helper.h"
#import <LocalAuthentication/LocalAuthentication.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TouchIDVCTL ()

@property (nonatomic, weak) IBOutlet UILabel *result;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TouchIDVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender
{
    BOOL is_simulator = [[Helper share] checkSimulator];
    if (is_simulator)
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
#pragma clang diagnostic ignored "-Wdeprecated"

        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"不是手机"
                                                            message:@"不是手机，请用手机"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
        [alertView show];
#pragma clang diagnostic pop
    }
    else
    {
        [self testTouchId];
    }
    
}

- (void) testTouchId
{
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"Touch ID Test to show Touch ID working in a custom app";

    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:myLocalizedReasonString
                            reply:^(BOOL success, NSError *error) {
                                if (success) {
                                   NSLog(@"sylar :  success = %@", myContext);
                                } else {
                                    NSLog(@"sylar :  failure");
                                }
                            }];
    } else {
        NSLog(@"sylar :  not support");
    }
}



@end

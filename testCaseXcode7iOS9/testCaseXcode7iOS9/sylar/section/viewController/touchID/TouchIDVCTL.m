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
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
#pragma clang diagnostic ignored "-Wdeprecated"
                                if (success) {
                                    dispatch_async(dispatch_get_main_queue(), ^{
//                                        [self performSegueWithIdentifier:@"Success" sender:nil];
                                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"success"
                                                                                            message:@"successsssssssss"
                                                                                           delegate:self
                                                                                  cancelButtonTitle:@"OK"
                                                                                  otherButtonTitles:nil, nil];
                                        [alertView show];

                                    });
                                } else {
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                            message:error.description
                                                                                           delegate:self
                                                                                  cancelButtonTitle:@"OK"
                                                                                  otherButtonTitles:nil, nil];
                                        [alertView show];
                                        NSLog(@"Switch to fall back authentication - ie, display a keypad or password entry box");
                                    });
                                }
                            }];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:authError.description
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil, nil];
            [alertView show];
        });
    }

#pragma clang diagnostic pop
    
}



@end

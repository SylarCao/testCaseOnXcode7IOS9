//
//  TouchIDVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/11.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TouchIDVCTL.h"
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
    [self testTouchId];
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

    
    
}



@end
